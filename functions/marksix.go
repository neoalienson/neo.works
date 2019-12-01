package marksix

import (
        "encoding/json"
        "fmt"
        "html"
        "net/http"
        "math/rand"
        "time"
)

func MarkSix(w http.ResponseWriter, r *http.Request) {
    time := time.Now().UnixNano()
    seed := rand.NewSource(time)
    r := rand.New(seed)
    arr := r.Perm(49)
    var s [6]int
    for i := 0; i < 6; i++ {
        s[i] = arr[i] + 1
    }
    
    wrapped := map[string]interface{} { 
        "lucky_numbers": s,
        "time": time,
    }
    enc := json.NewEncoder(w)
    enc.Encode(wrapped)
}
