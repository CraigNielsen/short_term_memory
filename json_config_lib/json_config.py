import os

'''
    CONFIG FILE TERMS:
        grouping key: a grouping for config with a single config file
    ALGORITHM TERMS:
        chunk: a list of config grouping with first item being the key
'''
OPENING_CONFIG_CHAR = '['
CLOSING_CHAR = ']'

class JsonConfig(dict):

    __dir_name = 'config_files'

    def __init__(self, file_name=None):
        self.file_name = file_name

# ++++++++++++++++ LAYER 1

    @staticmethod
    def _find_config_file_path(file_name):
        dir_path = os.path.dirname(os.path.realpath(__file__))
        config_file_name = None
        number_of_files = 0
        for root, dirs, files in os.walk(dir_path, topdown=False):
            for name in dirs:
                if name == JsonConfig.__dir_name:
                    config_file_name = root + "/" + name + "/" + file_name
                    number_of_files += 1
        assert(number_of_files < 2), 'to many config files with that name'
        return config_file_name

    @staticmethod
    def _read_lines_from_config_file(file_name):
        #  will read the file name from the static dir and filename
        # returns an array of lines
        with open(file_name) as f:
            content = f.readlines()
            # you may also want to remove whitespace characters like `\n` at the end of each line
            content = [x.strip() for x in content]
            content = filter(None, content)
        return content

    @staticmethod
    def chunk_lines(lines):

        def get_key_indexes(lines):
            # Find indexes for the split chars
            #  improve :https://stackoverflow.com/questions/176918/finding-the-index-of-an-item-given-a-list-containing-it-in-python
            indexes_of_config_keys = [index for index, value in enumerate(lines) if value[0] == OPENING_CONFIG_CHAR]
            return indexes_of_config_keys

        def chunk_out_lines_with_indexes(lis, indexes):
            chunks = []
            previous_index = 0
            for current_index in indexes+[len(lis)]:
                if current_index == 0:
                    continue
                chunks.append(lis[previous_index:current_index])
                previous_index = current_index
            return chunks

        chunks = chunk_out_lines_with_indexes(lines, get_key_indexes(lines))
        return chunks

    @staticmethod
    def build_dict_from_chunks(chunks):
        split_char = '='
        #  expects the first item in chunk to be the grouping key
        #  the rest of the values are config key value pairs
        dict_of_config = dict()
        for chunk in chunks:
            group_key = chunk[0].replace(OPENING_CONFIG_CHAR, "").replace(CLOSING_CHAR, "")
            key_value_pairs = chunk[1:]
            config_item = {}
            for key_value_pair in key_value_pairs:
                item = key_value_pair.split(split_char)
                config_item[item[0]] = item[1]
            dict_of_config[group_key] = config_item
        return dict_of_config

# ++++++++++++++++ LAYER 2

    @staticmethod
    def _fetch_config_lines_from_file(file_name):
        # read config_dir (config_files)
        file_to_parse = JsonConfig._find_config_file_path(file_name)
        lines = JsonConfig._read_lines_from_config_file(file_to_parse)
        return lines

    @staticmethod
    def _parse_config_lines(lines):
        # takes an array representation of a config file
        # will build chunks of config based on config keys [key]
        # will build dicts from the chunks
        chunks = JsonConfig.chunk_lines(lines)
        dict_of_config = JsonConfig.build_dict_from_chunks(chunks)
        return dict_of_config

# ++++++++++++++++++ LAYER 3
    def read_config(self):
        lines = JsonConfig._fetch_config_lines_from_file(self.file_name)
        dict_of_config = JsonConfig._parse_config_lines(lines)
        return dict_of_config
