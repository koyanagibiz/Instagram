import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CommentViewController: UIViewController {
    var postId : String = ""
    var postArray: [PostData] = []
    
    
    var comments:[String] = []
    var postdata : PostData?
    
    @IBOutlet weak var textMessage: UITextField!
    @IBOutlet weak var postComments: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func postMessage(_ sender: Any) {
        
        let name = Auth.auth().currentUser?.displayName
        let uid = Auth.auth().currentUser?.uid
       
        let postRef = Database.database().reference().child(Const.PostPath).child((postdata?.id!)!)
        
        let comment:String = name! + ":" + textMessage.text!
        
        self.comments.append(comment)
        
        postRef.updateChildValues(["comments":self.comments])
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
    
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
