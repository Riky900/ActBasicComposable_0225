#!/usr/bin/env bash
# Jalankan dari ROOT project (folder PRAKTIKUM3). Membuat TugasLogin.kt dalam 12 commit.
set -e
PKG=app/src/main/java/com/example/praktikum3
F=$PKG/TugasLogin.kt
D=app/src/main/res/drawable
mkdir -p $PKG $D

step() { # $1 = pesan commit ; stdin = kode yang ditambahkan
  cat >> "$F"; git add -A; git commit -q -m "$1"; echo "OK: $1"
}
vec() { # $1 nama file, $2 lebar, $3 tinggi, $4 warna
cat > $D/$1.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<!-- Placeholder. Hapus file ini dan ganti dengan $1.png / .jpg milik Anda. -->
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="${2}dp"
    android:height="${3}dp"
    android:viewportWidth="$2"
    android:viewportHeight="$3">
    <path android:fillColor="$4" android:pathData="M0,0h${2}v${3}h-${2}z" />
</vector>
EOF
}

# 1
step "feat: TugasLogin.kt - package dan import" << 'EOF'
package com.example.praktikum3

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

EOF

# 2-4 drawable placeholder
vec bg_login 360 640 "#FFD7C4A3"
git add -A; git commit -q -m "feat: tambah drawable bg_login (placeholder)"; echo "OK: bg_login"
vec logo_umy 200 200 "#FF1B5E20"
git add -A; git commit -q -m "feat: tambah drawable logo_umy (placeholder)"; echo "OK: logo_umy"
vec foto_profil 200 400 "#FF80B4D6"
git add -A; git commit -q -m "feat: tambah drawable foto_profil (placeholder)"; echo "OK: foto_profil"

# 5
step "feat: TugasLogin - Box penuh dan gambar background" << 'EOF'
@Composable
fun TugasLogin(modifier: Modifier = Modifier) {
    // GANTI dengan nama dan NIM Anda sendiri
    val nama = "Riky Tri Pamungkas"
    val nim = "ISI_NIM_ANDA"

    Box(modifier = modifier.fillMaxSize()) {
        Image(
            painter = painterResource(id = R.drawable.bg_login),
            contentDescription = null,
            modifier = Modifier.fillMaxSize(),
            contentScale = ContentScale.Crop
        )
EOF

# 6
step "feat: TugasLogin - Column, judul Login dan subjudul" << 'EOF'
        Column(
            modifier = Modifier
                .fillMaxSize()
                .statusBarsPadding(),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = "Login",
                fontSize = 36.sp,
                fontWeight = FontWeight.Bold,
                color = Color.Blue
            )
            Text(
                text = "Ini adalah halaman login,",
                fontSize = 16.sp,
                color = Color.White
            )
            Spacer(modifier = Modifier.height(80.dp))
EOF

# 7
step "feat: TugasLogin - logo kampus" << 'EOF'
            Image(
                painter = painterResource(id = R.drawable.logo_umy),
                contentDescription = null,
                modifier = Modifier.size(120.dp),
                contentScale = ContentScale.Fit
            )
            Spacer(modifier = Modifier.height(80.dp))
EOF

# 8
step "feat: TugasLogin - teks Nama dan NIM" << 'EOF'
            Text(
                text = "Nama",
                fontSize = 18.sp,
                fontWeight = FontWeight.Bold,
                color = Color.Red
            )
            Text(
                text = nama,
                fontSize = 18.sp,
                fontWeight = FontWeight.Bold,
                color = Color.Blue
            )
            Text(
                text = nim,
                fontSize = 28.sp,
                fontWeight = FontWeight.Bold,
                color = Color.Black
            )
            Spacer(modifier = Modifier.height(16.dp))
EOF

# 9
step "feat: TugasLogin - foto profil lingkaran dan tutup fungsi" << 'EOF'
            Image(
                painter = painterResource(id = R.drawable.foto_profil),
                contentDescription = null,
                modifier = Modifier
                    .size(280.dp)
                    .clip(CircleShape)
                    .border(width = 4.dp, color = Color.White, shape = CircleShape)
                    .background(color = Color(0xFFE8EAF6)),
                contentScale = ContentScale.Fit
            )
        }
    }
}
EOF

# 10
cat > $PKG/MainActivity.kt << 'EOF'
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
EOF
git add -A; git commit -q -m "feat: MainActivity memanggil TugasLogin"; echo "OK: MainActivity"

# 11 style (perl, aman di macOS)
perl -pi -e 's/Color\.Blue/Color(0xFF1A237E)/' $F
git add -A; git commit -q -m "style: ubah warna biru judul dan nama"; echo "OK: style warna"

# 12
perl -pi -e 's/fontSize = 28\.sp/fontSize = 30.sp/' $F
git add -A; git commit -q -m "style: perbesar teks NIM"; echo "OK: style NIM"

echo; git log --oneline | wc -l | xargs echo "Total commit di repo:"
echo "Selanjutnya: git push"
