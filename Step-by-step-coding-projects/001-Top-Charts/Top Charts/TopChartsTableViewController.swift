//
//  TopChartsTableViewController.swift
//  Top Charts
//
//  Created by Emirhan Erdogan on 2.02.2020.
//  Copyright © 2020 TurkishKit. All rights reserved.
//

import UIKit

class TopChartsTableViewController: UITableViewController {
    
    // MARK: - Functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SongData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell") as! SongTableViewCell
        let song = SongData[indexPath.row]
        cell.albumCoverImageView.setImage(fromUrl: URL(string: song.artworkUrl100)!)
        cell.songNameLabel.text = song.name
        cell.artistNameLabel.text = song.artistName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSongUrl = SongData[indexPath.row].url
        tableView.deselectRow(at: indexPath, animated: true)
        UIApplication.shared.open(URL(string: selectedSongUrl)!)
    }
    
}
