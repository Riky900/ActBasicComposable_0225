#!/usr/bin/env bash
# Jalankan dari ROOT project Android Studio (package com.example.praktikum3).
# Hasil: Tataletak.kt + MainActivity.kt + drawable, dalam 16 commit.
set -e
PKG=app/src/main/java/com/example/praktikum3
F=$PKG/Tataletak.kt
mkdir -p $PKG app/src/main/res/drawable
[ -d .git ] || git init -q

step() { # $1 = pesan commit ; stdin = kode yang ditambahkan
  cat >> "$F"; git add -A; git commit -q -m "$1"; echo "OK: $1"
}

# 1
cat > README.md << 'EOF'
# ActBasicComposable
Praktikum Pertemuan 3 - Basic Composable Layout (Column, Row, Box) di Jetpack Compose.
EOF
git add -A; git commit -q -m "docs: tambah README awal"; echo "OK: README"

# 2
step "feat: tambah package dan import Tataletak.kt" << 'EOF'
package com.example.praktikum3

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

EOF

# 3
step "feat: tambah TataletakColumn" << 'EOF'
@Composable
fun TataletakColumn(modifier: Modifier) {
    Column(modifier = modifier.padding(top = 20.dp, start = 20.dp, end = 20.dp)) {
        Text(text = "Komponen1")
        Text(text = "Komponen2")
        Text(text = "Komponen3")
        Text(text = "Komponen4")
    }
}

EOF

# 4
step "feat: tambah TataletakRow" << 'EOF'
@Composable
fun TataletakRow(modifier: Modifier) {
    Row(modifier = modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceEvenly) {
        Text(text = "Komponen1")
        Text(text = "Komponen2")
        Text(text = "Komponen3")
        Text(text = "Komponen4")
    }
}

EOF

# 5
step "feat: tambah TataletakBox" << 'EOF'
@Composable
fun TataletakBox(modifier: Modifier) {
    Box(
        modifier = modifier
            .fillMaxHeight()
            .fillMaxWidth(), contentAlignment = Alignment.Center
    ) {
        Text(text = "Box 1")
        Text(text = "Column 1")
        Text(text = "Row 1")
        Text(text = "Box 2")
        Text(text = "Column 2")
    }
}

EOF

# 6
step "feat: tambah TataletakColumnRow" << 'EOF'
@Composable
fun TataletakColumnRow(modifier: Modifier) {
    Column() {
        //Baris1
        Row(modifier = modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly) {
            Text(text = "Komponen1Baris1")
            Text(text = "Komponen2Baris1")
            Text(text = "Komponen3Baris1")
        }
        //Baris2
        Row(modifier = modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly) {
            Text(text = "Komponen1Baris2")
            Text(text = "Komponen2Baris2")
            Text(text = "Komponen3Baris2")
        }
    }
}

EOF

# 7
step "feat: tambah TataletakRowColumn" << 'EOF'
@Composable
fun TataletakRowColumn(modifier: Modifier) {
    Row(modifier = modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceEvenly) {
        //Kolom1
        Column() {
            Text(text = "Komponen1Kolom1")
            Text(text = "Komponen2Kolom1")
            Text(text = "Komponen3Kolom1")
        }
        //Kolom2
        Column() {
            Text(text = "Komponen1Kolom2")
            Text(text = "Komponen2Kolom2")
            Text(text = "Komponen3Kolom2")
        }
    }
}

EOF

# 8 (drawable placeholder - GANTI dengan gambar notasibalok milik Anda)
cat > app/src/main/res/drawable/notasibalok.xml << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<!-- Placeholder. Hapus file ini dan ganti dengan notasibalok.png/jpg milik Anda. -->
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="200dp"
    android:height="200dp"
    android:viewportWidth="24"
    android:viewportHeight="24">
    <path
        android:fillColor="#FF6200EE"
        android:pathData="M12,3v10.55c-0.59,-0.34 -1.27,-0.55 -2,-0.55c-2.21,0 -4,1.79 -4,4s1.79,4 4,4s4,-1.79 4,-4V7h4V3H12z" />
</vector>
EOF
git add -A; git commit -q -m "feat: tambah drawable notasibalok (placeholder)"; echo "OK: drawable"

# 9
step "feat: TataletakBoxColumnRow - gambar dan Box kuning (Row 1)" << 'EOF'
@Composable
fun TataletakBoxColumnRow(modifier: Modifier) {
    val gambar = painterResource(id = R.drawable.notasibalok)
    Column {
        Box(
            modifier = modifier
                .fillMaxWidth()
                .height(110.dp)
                .background(color = Color.Yellow),
            contentAlignment = Alignment.Center
        ) {
            Column() {
                Row(
                    modifier = modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    Text(text = "Col1_Row1_Komponen1")
                    Text(text = "Col1_Row1_Komponen2")
                    Text(text = "Col1_Row1_Komponen3")
                }
EOF

# 10
step "feat: TataletakBoxColumnRow - Row 2 dan tutup Box kuning" << 'EOF'
                Row(
                    modifier = modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    Text(text = "Col1_Row2_Komponen1")
                    Text(text = "Col1_Row2_Komponen2")
                    Text(text = "Col1_Row2_Komponen3")
                }
            }
        }
EOF

# 11
step "feat: TataletakBoxColumnRow - Spacer pemisah" << 'EOF'
        Spacer(modifier = Modifier.height(10.dp))
EOF

# 12
step "feat: TataletakBoxColumnRow - Box cyan dan Image" << 'EOF'
        Box(
            modifier = modifier
                .fillMaxWidth()
                .height(300.dp)
                .background(color = Color.Cyan),
            contentAlignment = Alignment.Center
        ) {
            Image(
                painter = gambar,
                contentDescription = null,
                contentScale = ContentScale.Fit
            )
EOF

# 13
step "feat: TataletakBoxColumnRow - teks My Music dan tutup fungsi" << 'EOF'
            Text(
                text = "My Music",
                fontSize = 50.sp,
                color = Color.Red,
                fontWeight = FontWeight.Bold,
                fontFamily = FontFamily.Cursive,
                modifier = Modifier.align(
                    alignment = Alignment.Center
                )
            )
        }
    }
}
EOF

# 14
cat > $PKG/MainActivity.kt << 'EOF'
package com.example.praktikum3

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.ui.Modifier
import com.example.praktikum3.ui.theme.PRAKTIKUM3Theme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            PRAKTIKUM3Theme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    // Panggil composable layout utama dengan padding dari Scaffold
                    TataletakBoxColumnRow(
                        modifier = Modifier.padding(innerPadding)
                    )
                }
            }
        }
    }
}
EOF
git add -A; git commit -q -m "feat: MainActivity memanggil TataletakBoxColumnRow"; echo "OK: MainActivity"

# 15 (style boleh diubah, komposisi tidak)
sed -i 's/Color.Yellow/Color(0xFFFFF59D)/; s/Color.Cyan/Color(0xFF80DEEA)/' $F
git add -A; git commit -q -m "style: ubah warna latar Box (komposisi tetap)"; echo "OK: style warna"

# 16
sed -i 's/color = Color.Red,/color = Color(0xFFD32F2F),/' $F
git add -A; git commit -q -m "style: ubah warna teks My Music"; echo "OK: style teks"

echo; git log --oneline | wc -l | xargs echo "Total commit:"
echo "Selanjutnya: git remote add origin <url-repo> && git push -u origin main"
