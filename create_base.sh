proj_name=$1

if [ ! $proj_name ]; then  
  echo "Project name is empty!!!"
  proj_name="Project"  
  
fi    

file_header="//
// $proj_name
//
// Create by $USER on $(date "+%Y/%m/%d")
//
"

main(){
    makeServiceModule
    makeBaseModule
}

makeServiceModule(){
    rm -rf Service/
    mkdir Service
    # Service.swift
    makeServiceFile
}

# Base empty file
makeBaseModule(){
    rm -rf Base/
    mkdir Base
    
    # UIView...
    base_view_array=("BaseCollectionViewController: BrickTableViewController<BaseCollectionView>" "BaseTableViewController: BrickTableViewController<BaseTableView>" "BaseModel: BrickModel" "BaseView: BrickView" "BaseTextField: BrickTextField" "BaseTableView: BrickTableView" "BaseCollectionView: BrickCollectionView" "BaseButton: BrickButton")
    for cls in "${base_view_array[@]}"
    do
    echo "$file_header
import UIKit
import BrickSwift

class $cls {

}" > Base/${cls%:*}.swift
    done

    # BaseViewController
    echo "$file_header
import UIKit
import BrickSwift

class BaseViewController: BrickViewController {
    
    override func bindToast() {
        toastDelegate = self
        super.bindToast()
    }

}

extension BaseViewController: BrickToastDelegate {
    func successToast(_ msg: String?) {
        fatalError(\"successToast(_:) has not been implemented\")
    }
    
    func errorToast(_ msg: String?) {
        fatalError(\"errorToast(_:) has not been implemented\")
    }
    
    func stateToast(_ msg: String?) {
        fatalError(\"stateToast(_:) has not been implemented\")
    }
    
    func loadingToast(_ msg: String?) {
        fatalError(\"loadingToast(_:) has not been implemented\")
    }
    
}" > Base/BaseViewController.swift

}

# service.swift
makeServiceFile(){
    echo "$file_header
import BrickSwift
import Alamofire

public enum Service {
    case test
}

extension Service: BrickService {
    public var baseURL: String {
        return ""
    }

    public var path: String {
        switch self {
            case .test: return \"\"
        }
    }

    public var method: HTTPMethod {
        return .get
    }

    public var parameters: Parameters {
        return [:]
    }

    public var encoding: ParameterEncoding {
        return JSONEncoding.default
    }

    public var headers: HTTPHeaders? {
        return [:]
    }

    public var timeout: TimeInterval {
        return 5.0
    }
}" > Service/Service.swift
}

main

