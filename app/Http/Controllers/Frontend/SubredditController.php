<?php

namespace App\Http\Controllers\Frontend;

use Inertia\Inertia;
use App\Http\Controllers\Controller;
use App\Models\Community;
use Illuminate\Http\Request;

class SubredditController extends Controller
{
    public function show($slug)
    {
        $subreddit = Community::where('slug', $slug)->first();
        return Inertia::render('Subreddits/Show', compact('subreddit'));
    }
}
