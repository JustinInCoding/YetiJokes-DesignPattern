/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import YetiTheme

public class ViewController: UIViewController {
  
  // MARK: - Instance properties
  public let jokeProvider: JokeProvider = JokeProvider(fileName: "jokes")
  
  // MARK: - Outlets
  @IBOutlet public var textLabel: UILabel!
  @IBOutlet public var segmentedControl: UISegmentedControl!
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
		textLabel.font = Fonts.small
  }
  
  // MARK: - Actions
  @IBAction public func segmentedControlValueChanged(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
			case 0:
				textLabel.font = Fonts.small
			case 1:
				textLabel.font = Fonts.medium
			case 2:
				textLabel.font = Fonts.large
			default:
				textLabel.font = Fonts.small
		}
  }
  
  @IBAction public func newJokePressed(_ sender: UIButton) {
    guard let joke = jokeProvider.jokes.randomElement() else {
      return
    }

    textLabel.text = joke.question + "\n\n" + joke.answer
  }
}
