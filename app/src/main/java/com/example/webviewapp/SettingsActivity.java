package com.example.webviewapp;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.google.android.material.textfield.TextInputEditText;

public class SettingsActivity extends AppCompatActivity {

    private TextInputEditText etUrl;
    private Button btnSave;
    private SharedPreferences sharedPreferences;
    private static final String PREFS_NAME = "WebViewPrefs";
    private static final String KEY_URL = "web_url";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);

        etUrl = findViewById(R.id.etUrl);
        btnSave = findViewById(R.id.btnSave);
        sharedPreferences = getSharedPreferences(PREFS_NAME, MODE_PRIVATE);

        String savedUrl = sharedPreferences.getString(KEY_URL, "");
        etUrl.setText(savedUrl);

        btnSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                saveUrl();
            }
        });

        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setTitle(R.string.settings);
        }
    }

    private void saveUrl() {
        String url = etUrl.getText().toString().trim();
        
        if (TextUtils.isEmpty(url)) {
            Toast.makeText(this, R.string.invalid_url, Toast.LENGTH_SHORT).show();
            return;
        }

        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putString(KEY_URL, url);
        editor.apply();

        Toast.makeText(this, R.string.url_saved, Toast.LENGTH_SHORT).show();
        finish();
    }

    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }
}
