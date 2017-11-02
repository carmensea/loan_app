def stub_file
  allow(File).to receive(:exists?).with("file").and_return(File)
end
