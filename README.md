![logo](https://github.com/thomaspaulmann/Wat/raw/gh-pages/images/Header.png?raw=true "Wat")

# What is it?
WAT is a sample implementation of cognitive services for iOS. It serves as example for [IBM Watson](http://www.ibm.com/watson/) and it's also a kind of a quick start assistant.

# What is it not?
It's not a whole implementation of every little detail of the Services provided by IBM. It gives a quick overview of the most common one. WAT is work in progress and will change with the [Watson iOS SDK](https://github.com/watson-developer-cloud/ios-sdk), as well as the Services itself.

# Current Status
As mentioned above, not every little detail is implemented. Here is an overview of the currently available Services and the their implementation status in WAT.

[![Build Status](https://travis-ci.org/thomaspaulmann/wat.svg?branch=master)](https://travis-ci.org/thomaspaulmann/wat)

## IBM Watson Services
- [ ] Alchemy Data News (Beta)
- [ ] Alchemy Language
- [x] Alchemy Vision (Deprecated, moved to Visual Recognition)
- [ ] Conversation (Beta)
- [ ] Dialog
- [ ] Document Conversation (Beta)
- [x] Language Translation
- [ ] Natural Language Classifier
- [ ] Personality Insights
- [x] Speech to Text
- [x] Text to Speech
- [ ] Tone Analyzer
- [ ] Trade Off Analytics (Beta)
- [ ] Visual Recognition

## Examples
Here are some Screencasts of the Services.

### Alchemy Vision
[AlchemyVision](http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/alchemy-vision.html) is an API that can analyze an image and return the objects, people, and text found within the image. AlchemyVision can enhance the way businesses make decisions by integrating image cognition. NOTE: The AlchemyVision service has been merged into the Visual Recognition service.

![alchemy-vision](https://github.com/thomaspaulmann/Wat/raw/gh-pages/images/gifs/AlchemyVision.gif?raw=true "Alchemy Vision")

### Language Translation
The [Language Translation service](http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/language-translation.html) translates and publishes content in multiple languages.

![language-translation](https://github.com/thomaspaulmann/Wat/raw/gh-pages/images/gifs/LanguageTranslation.gif?raw=true "Language Translation")

### Speech to Text
The [Speech to Text service](http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/speech-to-text.html) converts the human voice into the written word.

![speech-to-text](https://github.com/thomaspaulmann/Wat/raw/gh-pages/images/gifs/SpeechToText.gif?raw=true "Speech to Text")

### Text to Speech
Designed for streaming low-latency synthesis of audio from written text. The [service](http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/text-to-speech.html) synthesizes natural-sounding speech from input text in a variety of languages and voices that speak with appropriate cadence and intonation.

![text-to-speech](https://github.com/thomaspaulmann/Wat/raw/gh-pages/images/gifs/TextToSpeech.gif?raw=true "Text to Speech")

## Todos
- [ ] Documentation
- [ ] Use Visual Recognition instead of AlchemyVision
- [ ] Improve [Watson iOS SDK](https://github.com/watson-developer-cloud/ios-sdk) to easily upload Text and Images

# Some Notes
Some of you will be curiosed about the "Architecture" that is used in this project. I wanted to keep it as simple as possible. It should be easy to understand, to follow and to reuse. That is also a reason, why I decied to use more storyboard. Every Service should be as accessible as possible. This is very important to transfer the code into your projects to get a quick start into the cognitive era.

# Build
Update the Dependencies and run Carthage for the first time:

```
  carthage update --platform iOS
```

After that, you are good to go and can build the Xcode project.

# Contributing
You're more than welcome to help! If you would like to contribute, need informations or anything else, feel free to contact me.

# Special Thanks
There is a lot of Inspiration that goes back to IBM and it's great team behind Watson! Thanks a lot for this easy to use, powerful and great tool!
