<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class GenerateFilter extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'make:filter {name}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Generate a new Filter class';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $name = $this->argument('name');
        $filterPath = app_path('Filters/' . $name . 'Filter.php');

        if (file_exists($filterPath)) {
            $this->error('Filter already exists!');
            return;
        }
        $stub = file_get_contents(base_path().'/stubs/filter.stub');
        $filterContent = str_replace('{{name}}', $name, $stub);
        file_put_contents($filterPath, $filterContent);

        $this->info('Filter created successfully.');
        return Command::SUCCESS;
    }
}
