import 'package:flutter/material.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class InputFieldWidget extends StatelessWidget {
  final String hintText;

  const InputFieldWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}

class SubmitButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  const SubmitButtonWidget({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(83, 92, 145, 1),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class NavigationRowWidget extends StatelessWidget {
  final String text;
  final String actionText;
  final Function onPressed;

  const NavigationRowWidget({super.key, required this.text, required this.actionText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        GestureDetector(
          onTap: () => onPressed(),
          child: Text(
            actionText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

class SocialMediaButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const SocialMediaButtonWidget({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () => onPressed(),
    );
  }
}

// class Project {
//   String imageUrl;
//   String title;
//   String description;
//   String deadline;
//   String requirment;
//   String language;
//   String application;
//   String intake;

//   Project({
//     required this.imageUrl,
//     required this.title,
//     required this.description,
//     required this.deadline,
//     required this.requirment,
//     required this.language,
//     required this.application,
//     required this.intake,
//   });
// }

List<Project> projectList = [
  Project(
      id: '1',
      projectName: 'Social Media Analytics Tool',
      projectDescription:
          '  About this project : Develop a tool that collects and analyzes data from various social media platforms, providing insights such as engagement metrics, sentiment analysis, and trending topics.Social media analytics tools are all about using data to understand how youre doing on social media. ',
      applicationDeadline: DateTime(2024, 5, 23),
      techStacks: const [TechStack.express, TechStack.angular],
      projectDurationInDays: 40,
      intakeNumber: 10,
      specialization: Specialization.backEnd,
      createdBy: ''),
  // Project(
  //     title: 'Online Learning Platform',
  //     description:
  //         'A bout this project: A user-friendly platform, high-quality educational content, and engaging learning experiences are all essential for a successful online learning platform.Create a platform for online courses, including features like video lectures, quizzes, assignments, and progress tracking.The platform shall host a variety of content, including videos, text lectures, interactive exercises, quizzes, and downloadable resources.',
  //     imageUrl: "",
  //     deadline: 'Deadline: 10/7/2024',
  //     language: 'language you must know: javascript',
  //     application: 'application duration: 24/4/2024',
  //     intake: 'prsons intake:one person',
  //     requirment:
  //         'Requirment: Web development (HTML, CSS, JavaScript),Backend development (Node.js, Django, Flask, etc.),Database management (MySQL, PostgreSQL, MongoDB, etc.)'),
  // Project(
  //     title: 'Health Monitoring App ',
  //     description:
  //         'About this project: Build a mobile or web application that allows users to track their health metrics such as exercise, nutrition, sleep, and mood, providing personalized recommendations for improving overall well-being, Monitor a variety of health metrics like sleep patterns, activity levels, mood, and nutrition intake. Integrate with wearable devices to collect automated data.',
  //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVvR-19xe5iUJ-9ToZqgVxDJNbHubgbDh0xw&usqp=CAU',
  //     deadline: 'Deadline:21/2/2025',
  //     language: 'language you must know:c++,c',
  //     application: 'application duration: 3/5/2025',
  //     intake: 'prsons intake:one person',
  //     requirment: 'Requirment: Mobile app development (Flutter, React Native, etc.) or web development, User interface design '),
  // Project(
  //     title: 'Smart Home Automation System',
  //     description:
  //         'A bout this project: Develop a system that enables users to automate and control various smart devices in their homes, such as lights, thermostats, and security cameras, using a centralized interface. Utilize machine learning to create a personalized smart home experience. The system could anticipate your needs, adjust settings based on habits, and even interact with you conversationally',
  //     imageUrl: "",
  //     deadline: 'Deadline: 28/4/2024',
  //     language: 'language you must know:flutter',
  //     application: 'application duration:24/7/2024',
  //     intake: 'prsons intake:ten person',
  //     requirment: 'Requirement: Internet of Things (IoT) concepts'),
  // Project(
  //     title: 'E-commerce Recommendation Engine',
  //     description:
  //         'About this project: Design a recommendation engine that suggests products to users based on their browsing and purchase history, as well as demographic information and preferences.By analyzing the customers current site usage and previous browsing history,  you should form an eCommerce recommendation engine that deliver relevant product recommendations as he or she shops based on said profile.',
  //     imageUrl: "",
  //     deadline: 'Deadline:30/4/2024',
  //     requirment: 'Requirment: Data analysis and machine learning',
  //     language: 'language you must know: flutter ',
  //     application: 'application duration: 25/9/2025',
  //     intake: 'prsons intake: three person'),
  // Project(
  //     title: 'Language Learning App',
  //     description:
  //         'About this project Create an app that helps users learn a new language through interactive lessons, vocabulary quizzes, speaking exercises, and progress tracking features.',
  //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh4WacG9TTYMXQfFwDrvCMIXAFOxIesGZ6TQ&usqp=CAU',
  //     deadline: 'Deadline: 30/4/2024',
  //     language: 'language you must know:java, python',
  //     application: 'application duration: 1/7/2024',
  //     intake: 'prsons intake:five person',
  //     requirment: 'Requirment: Mobile app development (Flutter, React Native, etc.), User interface design'),
  // Project(
  //     title: 'Virtual Reality Game',
  //     description:
  //         'About this project: Develop an immersive virtual reality game with realistic graphics, interactive environments, and engaging gameplay mechanics, leveraging platforms like Unity or Unreal Engine.',
  //     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIBLXuCAKwEKcJk_GFv9XO3hsNBdQOJFj12g&usqp=CAU',
  //     deadline: 'Deadline: 16/9/2024',
  //     language: 'language you must know:Pyhton ',
  //     application: 'application duration:24/4/2024',
  //     intake: 'prsons intake:two person',
  //     requirment: 'Requirment: Game development (Unity, Unreal Engine, etc.), 3D modeling and animation'),
  // Project(
  //     title: 'Finance Tracker',
  //     description:
  //         'About this project: Build a personal finance management tool that allows users to track their income, expenses, budgets, and investments, providing insights into their financial health and goals. it should Easily record your income (salary, side hustles, etc.) and expenses (bills, groceries, shopping, etc.)Organize your transactions into categories like rent, utilities, transportation, food, entertainment, and more.',
  //     imageUrl: "",
  //     deadline: 'Deadline: 19/7/2024',
  //     requirment: 'Requirment: Mobile or web development',
  //     language: 'language you must know:html,css.java script',
  //     application: 'application duration:6/9/2024',
  //     intake: 'prsons intake: one person'),
  // Project(
  //     title: ' SupChatbot for Customerport',
  //     description:
  //         'About this projet: Design a chatbot that can interact with users in natural language, answering frequently asked questions, providing product recommendations, and escalating complex queries to human agents when necessary.A SupChatbot, combining "super" and "chatbot,"  can be a powerful tool for customer support project',
  //     imageUrl: "",
  //     deadline: 'Deadline: 12/12/2024',
  //     requirment: 'Requirment: Natural language processing, Chatbot development frameworks (Dialogflow, Rasa, etc.)',
  //     language: 'language you must know: html, css',
  //     application: 'application duration:10/10/2024',
  //     intake: 'prsons intake: four person'),
  // Project(
  //   title: 'Data Visualization Dashboard',
  //   description:
  //       'About this project: Create a dashboard that visualizes complex data sets using interactive charts, graphs, and maps, enabling users to explore and gain insights from the data more easily. Track your income, expenses, savings, and investments over time. Visualize your progress towards financial goals using charts and graphs.',
  //   imageUrl: "",
  //   deadline: 'Deadline: 15/11/2024',
  //   requirment: 'Requirement: Data visualization libraries (D3.js, Chart.js, etc.),Backend development (Node.js, Django, Flask, etc.)',
  //   language: 'language you must know: flutter',
  //   application: 'application duration:30/12/2024',
  //   intake: 'prsons intake:four person',
  // ),
  // Project(
  //   title: 'Remote Collaboration Tool',
  //   description:
  //       'About this project: Build a platform that facilitates remote collaboration and communication among team members, offering features like video conferencing, file sharing, task management, and real-time collaboration on documents. Combine task management features like assigning tasks, setting deadlines, and tracking progress with built-in chat or video conferencing functionalities',
  //   imageUrl: "",
  //   deadline: 'Deadline:13/3/2024',
  //   requirment: 'Requirmment: Front end development',
  //   language: 'language you must know:pyhton',
  //   application: 'application duration:04/04.2024',
  //   intake: 'prsons intake:two person',
  // )
];

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;

  const SectionHeader({required this.title, required this.subtitle, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            icon,
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(83, 92, 145, 1)),
            ),
          ],
        ),
        Text(subtitle),
      ],
    );
  }
}

class AppForm extends StatelessWidget {
  final List<Widget> formFields;
  final String sectionHeaderTitle;
  final String sectionHeaderSubtitle;
  final Icon sectionHeaderIcon;
  final String buttonText;
  final void Function() onButtonPressed;
  final GlobalKey<FormState> formKey;

  const AppForm({
    required this.formFields,
    required this.sectionHeaderTitle,
    required this.sectionHeaderSubtitle,
    required this.sectionHeaderIcon,
    required this.buttonText,
    required this.onButtonPressed,
    required this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SectionHeader(
              title: sectionHeaderTitle,
              subtitle: sectionHeaderSubtitle,
              icon: sectionHeaderIcon,
            ),
            const SizedBox(width: double.infinity, height: 10.0),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 600),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: double.infinity, height: 15),
                itemCount: formFields.length,
                itemBuilder: (BuildContext context, int index) => formFields[index],
              ),
            ),
            ElevatedButton(
              onPressed: onButtonPressed,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                backgroundColor: const Color.fromRGBO(83, 92, 145, 1),
              ),
              child: Text(
                buttonText.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
