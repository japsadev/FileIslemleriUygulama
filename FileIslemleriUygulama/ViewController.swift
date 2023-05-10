//
//  ViewController.swift
//  FileIslemleriUygulama
//
//  Created by Salih Yusuf Göktaş on 10.05.2023.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var textfieldGirdi: UITextField!
	@IBOutlet weak var resimTutucu: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}
	@IBAction func yaz(_ sender: Any) {
		
		let mesaj = textfieldGirdi.text!
		
		if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
			
			let dosyYolu = dir.appendingPathComponent("dosyam.txt")
			
			do {
				try mesaj.write(to: dosyYolu, atomically: false, encoding: String.Encoding.utf8)
				
				textfieldGirdi.text = ""
				
			}catch{
				print("Dosya yazılırken hata oluştu")
			}
		}
		
	}
	@IBAction func oku(_ sender: Any) {
		
		if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
			
			let dosyYolu = dir.appendingPathComponent("dosyam.txt")
			
			do {
				
				textfieldGirdi.text = try String(contentsOf: dosyYolu, encoding: String.Encoding.utf8)
				
			}catch{
				print("Dosya okurken hata oluştu")
			}
		}
	}
	@IBAction func sil(_ sender: Any) {
		
		if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
			
			let dosyYolu = dir.appendingPathComponent("dosyam.txt")
			
			if FileManager.default.fileExists(atPath: dosyYolu.path) {
				do {
					
					try FileManager.default.removeItem(at: dosyYolu)
					textfieldGirdi.text = ""
					
				}catch{
					print("Dosya silerken hata oluştu")
				}
			}
			
			
		}
	}
	@IBAction func resimKaydet(_ sender: Any) {
		
		if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
			
			let dosyYolu = dir.appendingPathComponent("resimim.png")
			
			let resim = UIImage(named: "resim")
			
			do {
				try resim!.pngData()?.write(to: dosyYolu)
				
			}catch{
				print("Dosya yazılırken hata oluştu")
			}
		}
	}
	@IBAction func resimGoster(_ sender: Any) {
		
		if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
			
			let dosyYolu = dir.appendingPathComponent("resimim.png")
			
			self.resimTutucu.image = UIImage(contentsOfFile: dosyYolu.path)
			
		}
	}
	@IBAction func resimSil(_ sender: Any) {
		
		if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
			
			let dosyYolu = dir.appendingPathComponent("resimim.png")
			
			if FileManager.default.fileExists(atPath: dosyYolu.path) {
				do {
					
					try FileManager.default.removeItem(at: dosyYolu)
					
					
				}catch{
					print("Resim silerken hata oluştu")
				}
			}
		}
		
	}
}
