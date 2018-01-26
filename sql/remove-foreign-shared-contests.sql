delete from xcolab_Contest where isSharedContest = 1 and
  not sharedOrigin = (select stringValue from xcolab_ConfigurationAttribute where name ='COLAB_NAME');
