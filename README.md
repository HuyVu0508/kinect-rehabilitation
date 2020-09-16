# Real-time Physical Therapy Assisting System using Kinect

## Introduction

Physical therapy is intensely used in medical treatments to help patients regain their movements abilities after injury or operations. It can be considered a safe treatment for the reason that it doesn't require injection or having drugs into the body which might potentially cause side effects and other potential risks. In order to practice, patients usually need the supervision from professional therapists who will monitor and give feedback in real-time for improvements. This, however, poses a problem, that is patients need the therapists' presence whenever they want to practice, and therefore causing a time and monetary restriction problem. This strictly limits the practices of patients. The figure below illustrates the four arms rehabilitation practices used in this work.

<p align="center">
  <img width="500" src="../master/illustrations/sample_practices.jpg">
</p>
<p align="center">
    <em>Four samples practices used as samples in this study:</em>
    <em>(a) Arm XY, (b) Arm XZ, (c) Arm YZ, (d) Elbow</em>
</p>


Therefore, if we can build a home system that can partially replace the role of the therapists in helping the rehabilitation process, that would greatly benefit the patients. It will reduce the cost of traveling for both patients and therapists. In addition, patients can also practice anytime and anywhere without the need to match the therapists' busy schedule.

In this work, we propose a system using Microsoft Kinect to play the role of the therapist in monitoring patients' practices. The system will first record the sample practices from a professional therapist, then use them as gold-standards to compare against patients' practices to check whether the patients have executed the moves correctly or not. At the same time, giving instructions and feedback in real-time using AR technology.

## Methodology
We can divide the problem of building such system into smaller problems, corresponding to the system pipeline and function modules:
* Module for recording and saving sample practices (from professional therapist)
* Module for recording actual practices (from patients)
* Module for comparing patients' practices to therapists' practices and give feedback
* Module for helpful features, such as instructing patients and providing real-time feedbacks using AR

#### Recording therapists’ sample practices
First, we design a pipeline for efficiently recording the sample practices by therapists as gold standards. The 3D space locations of the joints are recorded and processed and saved in the memory. The figure below illustrates a recorded and processed signal of one practice move (Arm XY). The signals are calibrated to be invariant to different body's types by normalizing users’ limbs length. The sample practice therefore can be recorded by one therapist and can be used for many patients' cases with different body shapes.

<p align="center">
  <img width="700" src="../master/illustrations/movement_signal.png">
</p>
<p align="center">
    <em>Signal recorded and processed for one practicing movement.</em>
</p>

#### Recording patients’ actual practices
The second step is designing a pipeline for recording patients' practices that are able to assess the practice on-the-fly and give feedback (without requiring the move to be finished). For example, the system can detect whether the movement range is correct or not and suggest where to fix. We does this by using the Dynamic Time Warping (DTW) algorithm to compare the patients' and therapists' movements signals. The figure below illustrates the DTW algorithm used to match processed Kinect signals from patients and therapists.

<p align="center">
  <img width="500"  src="../master/illustrations/DTW.jpg">
</p>
<p align="center">
    <em>Dynamic warping algorithm used to match practices signals from patients to therapists'.</em>
</p>

Notice that one advantage of DTW algorithm is it can match two signals having different speed. This is necessary since in many cases, the patients would execute a movement much slower than the normal speed due to the possible pain and difficulties in practicing the limbs. The figure below illustrates the module's pipeline for recording patients' practice and evaluating it on-the-fly. Feedbacks are given for the patients to improve their performances.

<p align="center">
  <img width="700" src="../master/illustrations/record_evaluate_pipipeline.jpg">
</p>
<p align="center">
    <em>Pipeline for recording patients' practices, creating a framework for providing real-time instructions and feedbacks.</em>
</p>

#### Comparisons and rating practices quality
Besides evaluating the patients' performance in real-time, we also want to evaluate them at the end of the practices by calculating the accumulated errors and infer the practicing scores. This evaluation will determine whether the movement executed is good enough or not and needs to be executed again. The figure below illustrates how a movement is evaluated based on its accumulated errors.

<p align="center">
  <img width="400" src="../master/illustrations/error_evaluation.png">
</p>
<p align="center">
    <em>Patients' practices evaluating criteria.</em>
</p>

From the automatic rating of the patients’ practices by the system, we can determine whether the practices were correct enough or not. In order to test the performance of this rating mechanism, we measure the True Positive and True Negative predictions from the system. To be more particular, we performed 10 purposefully correct and incorrect practices and test how good the predictions from the system are. The table below illustrates how well the system evaluates correctly a movement using the described rules. We see that the system has high performance in evaluating practices quality.

<p align="center">
  <img width="500" src="../master/illustrations/evaluation_model.png">
</p>
<p align="center">
    <em>Evaluating system's performance on classifying practices correctness.</em>
</p>

#### Real-time instructions and feedback using Augmented Reality
To help the patients' with their practices, we develop an AR system to help instructing their limbs movements by showing in real-time where the current and next positions their limbs should be. To determine the next limbs position, we utilize the local Dynamic Time Warping approach, where we can detect which stage the users are currently in and therefore suggest the next limbs position. The users feedback indicates that this feature does improve the experience. The patients hence do not need to remember what the next movement is (which has been shown on the screen thanks to AR features), so they can focus on executing the moves correctly. The figure below illustrating the AR features in actions.

<p align="center">
  <img width="300" src="../master/illustrations/ar.png">
</p>
<p align="center">
    <em>Augmented reality features for real-time instructions and feedbacks.</em>
</p>

The figure below illustrates the usage of local DTW matching the executing patients’ practices with the therapists’ sample practices. Notice that this mechanism does not require to have the full finished signal to match against the gold-standards.


<p align="center">
  <img width="500" src="../master/illustrations/local_DTW.jpg">
</p>
<p align="center">
    <em>Local dynamic warping algorithm.</em>
</p>

#### User interface
We develop the user interface with the objective for simplicity and being informative in mind. Below is our main interface for the system with explanations for each section's functions.

<p align="center">
  <img width="900" src="../master/illustrations/interface.png">
</p>
<p align="center">
    <em>System user interface.</em>
</p>

For more detailed information, please look at the thesis.pdf (in Vietnamese) file included in this repository.
