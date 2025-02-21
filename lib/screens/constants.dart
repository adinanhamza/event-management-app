


import 'package:event_managment/model/vendormodel.dart';

class AppConstants {
                                // HOMESCREEN TEXT
  // App Bar
  static const String appTitle = 'EVENTO';
  static const String appSubtitle = 'Plan your perfect event';
  
  // Categories
  static const String categoriesTitle = 'Categories';
  static const String catSocial = 'SOCIAL';
  static const String catCorporate = 'CORPORATE';
  static const String catSpecial = 'SPECIAL';
  static const String catWedding = 'WEDDING';
  static const String popularVendorsTitle = 'Popular Vendors';
  
  // Search
  static const String searchHint = 'Search events, venues, or vendors...';
  static const String noResults = 'No results found';

  // favorites
  static const String addedfavorites = 'Added to favorites';
  
  // Images
  static const List<String> homeBannerImages = [
    'asset/aessthedining.jpeg',
    'asset/caterngser.webp',
    'asset/diningarea.jpg',
    'asset/mrginvita.jpg',
    'asset/cakeevents.jpg',
    'asset/mrgfuntione.jpg',
    'asset/traditionalevents.webp',
    'asset/American-Express-Orana-food.jpg'
  ];

  // Vendors
  static final List<vendormodel> vendors = [
    vendormodel(
      id: '1',
      name: 'Destination Weddings',
      description: 'Destination function',
      imagepath: 'asset/beachwe.webp',
    ),
    vendormodel(
      id: '2',
      name: 'Bluewind Blogs',
      description: 'Photography & videography',
      imagepath: 'asset/handevnt.jpg',
    ),
    // Add other vendors...
    vendormodel(id: '3', name: 'Co-Op Event', description: 'Coperate program', imagepath: 'asset/eventcontroller.jpg'),
    vendormodel(id: '4', name: 'Decor Premium', description: 'decoration arts', imagepath:'asset/night eve.webp'),
    vendormodel(id: '5', name: 'Vench Events', description: 'premium events', imagepath: 'asset/weddingstunning.webp')
  ];

  // Navigation
  static const List<Map<dynamic, dynamic>> bottomNavItems = [
    {'label': 'Home', 'icon': 'home'},
    {'label': 'Booking', 'icon': 'add_circle'},
    {'label': 'Events', 'icon': 'event'},
    {'label': 'Profile', 'icon': 'person'},
  ];
}
                                       // BOOKINGSCREEN                                       


                                         // COROPERATE SCREEN
class CorporateEventConstants {
  // Text constants
  static const String appBarTitle = 'Corporate Events';
  static const String pageHeading = 'Plan your next corporate event with us.';
  static const String pageSubheading = 'From business conferences to networking meets, we provide top-notch venues and services to make your event a success.';

  // Event types data
  static const List<EventData> eventsList = [
    EventData(
      title: 'Business Conference',
      imagePath: 'asset/coporatebusinees.jpg',
      description: 'Host professional conferences with top-tier facilities.',
    ),
    EventData(
      title: 'Networking Meet',
      imagePath: 'asset/coporatenet.jpeg',
      description: 'Engage and expand your business network in style.',
    ),
    EventData(
      title: 'Award Ceremonies',
      imagePath: 'asset/coperate managmnt.jpg',
      description: 'Celebrate achievements with an elegant corporate setup.',
    ),
    EventData(
      title: 'Product Launch',
      imagePath: 'asset/coporateproduct.jpg',
      description: 'Showcase your latest products with a stunning launch event.',
    ),
    EventData(
      title: 'Workshops & Seminars',
      imagePath: 'asset/coporatework.jpeg',
      description: 'Conduct knowledge-sharing sessions with professionals.',
    ),
  ];
}

// models.dart
class EventData {
  final String title;
  final String imagePath;
  final String description;

  const EventData({
    required this.title,
    required this.imagePath,
    required this.description,
  });
}

class BookingConstants {
  // Text Content
  static const String bookingTitle = 'TELL US ABOUT YOUR EVENT';
  static const String bookingSubtitle = 'Fill in this handy form below and we will get back to you promptly';
  static const String addImageText = 'Add Image';
  static const String nameLabel = 'Name';
  static const String phoneLabel = 'Enter Your Phone Number';
  static const String emailLabel = 'Enter Your Email here';
  static const String dateLabel = 'Enter Date here';
  static const String locationLabel = 'Enter location here';
  static const String eventTypeLabel = 'Select Event';
  static const String submitButtonText = 'Submit';
  static const String invalidFormMessage = 'Please fill all required fields';
  static const String submissionSuccessMessage = 'Submitted';

  // Event Types
  static const List<String> eventTypes = [
    'Wedding',
    'Birthday',
    'Corporate',
    'Private',
    'Special'
  ];

  // Image Paths
  static const String avatarPlaceholder = 'asset/avatarcontact.jpg';
  
  // Date Format
  static const String dateFormat = 'yyyy-MM-dd';
}
class accountscreen{
                                    
                  
  // Account Screen
  static const String profileImage = 'asset/profile.jpg';
  static const String accountName = 'Jhony Walker';
  static const String accountRole = 'Event Client';
  static const String eventsCount = '26';
  static const String attendingCount = '14';
  static const String followingCount = '137';
  
  static const String personalInfoTitle = 'Personal Information';
  static const String emailaccount = 'Email';
  static const String userEmail = 'jhonywalker67@gmail.com';
  static const String phoneaccount = 'Phone';
  static const String userPhone = '+91 9897434752';
  static const String locationaccount = 'Location';
  static const String userLocation = 'New York , USA';
  static const String organizationLabel = 'Organization';
  static const String userOrganization = 'Event Client';
  
  static const String settingsTitle = 'Settings & Privacy';
  static const String notificationsLabel = 'Notification Preferences';
  static const String privacyLabel = 'Privacy Settings';
  static const String paymentLabel = 'Payment Methods';
               
                                             
}

class detailsConstants {
  // Titles
  static const String eventDetailsTitle = 'EVENT DETAILS';
  static const String viewChartButton = 'View Chart';

  // Labels
  static const String labelName = "Name";
  static const String labelEmail = "Email";
  static const String labelPhone = "Phone";
  static const String labelDate = "Date";
  static const String labelLocation = "Location";
  static const String labelVenue = "Venue";

  // Image Paths
  static const String defaultProfileImage = 'asset/avatarcontact.jpg';
}

class editConstants {
  // Titles
  static const String editBookingTitle = 'EDIT BOOKING';
  static const String formHeaderTitle = 'TELL US SOMETHING NEW';
  static const String formSubText = 'Fill in this handy form below and we will get back to you promptly';
  static const String addImage = 'Add Image';
  static const String submitButton = 'Submit';

  // Labels
  static const String labelName = 'Name';
  static const String labelEmail = 'Email';
  static const String labelPhone = 'Phone';
  static const String labelDate = 'Enter Date here';
  static const String labelLocation = 'Enter location here';
  static const String labelVenue = 'What kind of Event';

  // Image Paths
  static const String defaultProfileImage = 'asset/avatarcontact.jpg';
}

class listeventConstants {
  // Titles
  static const String eventTitle = 'Events';
  static const String noEventsFound = 'No events found';

  // Labels
  static const String editButtonTooltip = 'Edit Event';

  // Image Paths
  static const String defaultProfileImage = 'asset/avatarcontact.jpg';
}

class specialConstants {
  // Titles
  static const String privateTitle = "Special Events";
  static const String privateSubtitle = "Exclusive Special Events";
  static const String privateDescription =
      "Celebrate your special moments with our tailor-made events, ensuring unforgettable experiences.";

  // Section Titles
  static const String privateServicesTitle = "Our Services";

  // Service List
  static const List<Map<String, String>> privateServices = [
    {
      'title': "Luxury & VIP Experiences",
      'subtitle': "Exclusive venues, premium service, and high-end experiences.",
      'icon': "star"
    },
    {
      'title': "Live Entertainment",
      'subtitle': "World-class performers, DJs, and shows tailored for your event.",
      'icon': "music_note"
    },
    {
      'title': "Theme Parties & Festivals",
      'subtitle': "Unique themed events for birthdays, anniversaries, and more.",
      'icon': "celebration"
    },
  ];

  // Image Paths
  static const List<String> privateImages = [
    "asset/privatepeo.jpg",
    "asset/privatelux.jpg",
    "asset/privatetema.jpg"
  ];
}


class socialConstants {
  // Titles
  static const String socialTitle = "Social Events";
  static const String socialHeader = "Celebrate with Style";
  static const String socialSubHeader = "Memorable Moments";
  static const String socialPackages = "Customizable Packages";

  // Descriptions
  static const String socialDescription =
      "Social events bring people together to celebrate special moments. Whether it's a birthday, anniversary, or casual gathering, our team ensures an unforgettable experience with top-tier service and ambiance.";

  static const String socialDetails =
      "From elegant dinners to lively parties, our team curates social gatherings tailored to your vision. Let us handle the details while you enjoy every moment.";

  static const String socialPackagesDescription =
      "We offer a variety of packages to suit your event size and style. From intimate gatherings to grand celebrations, find the perfect setup for your occasion.";

  // Image Paths
  static const List<String> socialImages = [
    "asset/socialpu - Copy.jpg",
    "asset/socialgettogether.jpg",
    "asset/socialfestival.jpeg",
    "asset/socialinpublic.png"
  ];
}


class weddingConstants {
  // Titles
  static const String weddingTitle = "Wedding Events";
  static const String weddingHeader = "Your Dream Wedding Awaits";
  static const String weddingServices = "Exclusive Wedding Services";

  // Descriptions
  static const String weddingDescription =
      "Experience a once-in-a-lifetime event with exquisite venues, stunning decorations, and world-class catering. Let us make your wedding truly magical.";

  // Services List
  static const List<Map<String, String>> weddingServicesList = [
    {"title": "Luxury Venues", "description": "Choose from breathtaking locations to celebrate your big day."},
    {"title": "Catering & Cuisine", "description": "Enjoy a customized menu tailored to your preferences."},
    {"title": "Professional Photography", "description": "Capture every precious moment with our expert photographers."},
    {"title": "Stunning Decorations", "description": "Transform your venue into a dream setting with elegant decor."}
  ];

  // Image Paths
  static const List<String> weddingImages = [
    "asset/mrgfuntione.jpg",
    "asset/weddingluxuryven.jpeg",
    "asset/weddingcater.jpg",
    "asset/handevnt.jpg",
    "asset/weddingstunning.webp",
  ];
}

class wishlistConstants {
  // Titles
  static const String wishlistTitle = "Wishlist";
  static const String noFavoritesText = "No favorites yet";

  // Default Placeholder Image
  static const String defaultImage = "asset/avatarcontact.jpg";
}
