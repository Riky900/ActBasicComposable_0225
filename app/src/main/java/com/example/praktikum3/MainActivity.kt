package com.example.praktikum3

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import com.example.praktikum3.ui.theme.PRAKTIKUM3Theme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            PRAKTIKUM3Theme {
                // Tugas login. Untuk demo praktikum ganti dengan:
                // TataletakBoxColumnRow(modifier = Modifier)
                TugasLogin()
            }
        }
    }
}
