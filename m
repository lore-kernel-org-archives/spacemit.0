Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0BB2F1FEE
	for <spacemit@lists.linux.dev>; Sat,  6 Dec 2025 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765028342; cv=none; b=owrtd7JsY/7LrH2p8tIrHZ4xzc1FGMOkunkznoj91GW61TgFU4R4UYyq3UT0k8dF8QYnVL0oCywGRpuimR08MnEXy/gtbPTGtANNKyyEfRy0nBBFsUbbExrhUNthkTlYNxXvUkdwGYC2x5dAqW+qfeAvUoQ/wHkmvzzj3iy0wqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765028342; c=relaxed/simple;
	bh=b5IgoR0twCWiviYQH3Grz/xTbzraoHaR2KLRP76V/zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=BnfngEBJiWPYS/jm7yZ6KGgFrzHM+gFgiaC9b6wA6FWYnd3PSmWdUCKAjQaDwrtBn1z4l49v5McX0FzVTgkFQ6TEoqXNejpKkgaoCSzlxn8G7mem36BYn77uw/eBm23qj4ijtDliptlZdN1nT/vcdE4BBgYxQ2TCvxDlfY7WBzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f6t5fUqK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f6t5fUqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765028339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QC70i/lfryfDMLlz9PR/W22hsTXwtyfjKxX5Z38dT/M=;
	b=f6t5fUqKtw/MucVRUZ1K7WkJUCijjvWi41asJkVQYsFCMGOfkOVsUQG5D/yriRGYdctBdp
	2WHA4WaUeyOquQVbhSUse0dh1kkOof5dyy/pKQIR1cLluEWGY7pc0a5mieNj15USfIkADF
	3ZJebQyGXIWMRuiKs3g19hh0xFNIG20=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-nD9d_JM-Pqihi3KU8SLdvg-1; Sat, 06 Dec 2025 08:38:57 -0500
X-MC-Unique: nD9d_JM-Pqihi3KU8SLdvg-1
X-Mimecast-MFC-AGG-ID: nD9d_JM-Pqihi3KU8SLdvg_1765028337
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477cf2230c8so25433755e9.0
        for <spacemit@lists.linux.dev>; Sat, 06 Dec 2025 05:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765028336; x=1765633136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QC70i/lfryfDMLlz9PR/W22hsTXwtyfjKxX5Z38dT/M=;
        b=mKwZqiGx2pJV1lEobbJSWTWotrheqRRcb0jNYQVCV8gL43RcNOD1kY98X+4hWNmvm/
         voLnl1GJcZa7HUv0n6nZx1hfeugf2jebgvmGTeHc8+cBTaCQzdNzob1Twi8fpCB5gpWW
         zgDS2Ephlw4YsN1OtGl6G/jYR1nZtdX5JaeqBX/MpSgq16qfdY3p7lSRubYlPEP6r7yN
         OmnMu4tqdnZnvGf14L/CX0n+ju31Ykb9H0Hc/6/E+w5wX27bLZgERa1irQvLdne1tO49
         MlFi+QGsUeVGtWwXyQ6vDrP5mmhdLUk0VYxhG1LyfBQa7DWqz/caqrG8Glcl6e3rR034
         abuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhye5/Z07fsCVRnXa8DqG5A2ByG7Qz236oxkLF1vved94xseWcp3tw2Dy+t2Ai9fkl6iC4X+IGHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2xBuK8iDpi+H0qQLLsbeqB5f2hI8GA9jobbR7jcbx6Ka5DMOz
	FtFElPee8UkYXgoRzJapT0NiXlOm7PHVu52yo1A/R0hOpypHYNtdSyjFSNLwEG2SiSI3+VpYC0a
	lI7gIp00Zo2z4wXcgVa3+99Xtdpj8L9XF8Twa7Aow4+T8WO9SGWAXYzlTW91d
X-Gm-Gg: ASbGncuUEy2dZJYPzbm+oeE1gmfi8Q4DjhENR4a2evw97Vvo87H911ZMyDaLi4DEH1i
	3t2cPQqUCZmNod18V4U6z1HZQGOoCn2PW3lCeMkxZzQOJdedWf8eNkd9mWJlpiTdpQ/ldM+tmYN
	GgAzZ+C29FRCL3A0Xk+HqBCMiUfVNOCsRrzS5goOW/aHmS4Qjl0pMSpUL3y3oCHMfQq3PdazQ4D
	QRD7G7AglfVd8iHUZAjJ3ZWaJ3cHwFZmNBVPaEldMJLwQz4wUTi2hqmccegrZn8qwNBxaEA31YC
	hnCMuV7zagFcahRW5FY8SOCX2YhQYf+PsFh+WK5an03NL0EbM6dv4o3RewiPUtJs0/lOnEGQKtf
	Rn627hFOjQWz0rgcKTRP1iWiPDwNzleEO96c=
X-Received: by 2002:a05:600c:1e28:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-47939e38284mr26973565e9.23.1765028336554;
        Sat, 06 Dec 2025 05:38:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt+JYoskz9q0dOZUvI2zbL7PpqoIgzpl9VZcFu80JojTUue0FS/d/Bo0yeWUR73XDazyVsPw==
X-Received: by 2002:a05:600c:1e28:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-47939e38284mr26973345e9.23.1765028336171;
        Sat, 06 Dec 2025 05:38:56 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeae9sm15157012f8f.13.2025.12.06.05.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 05:38:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Alex Elder <elder@riscstar.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH] regulator: spacemit: Align input supply name with the DT binding
Date: Sat,  6 Dec 2025 14:38:48 +0100
Message-ID: <20251206133852.1739475-1-javierm@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1wFMLzzhtZyx5hdo0yTi6P_nLATjnDEM7QdMIBN8op8_1765028337
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The Device Tree binding schema for the SpacemiT P1 PMIC defines the main
input supply property as "vin-supply", but the driver defines the supply
name for BUCK and ALDO regulators as "vcc".

This causes the regulator core to lookup for a non-existent "vcc-supply".
Rename the supply from "vcc" to "vin", to match the DT binding and ensure
that the regulators input supplies are correctly resolved.

After this change, the regulators supply hierarchy is correctly reported:

  $ cat /sys/kernel/debug/regulator/regulator_summary
   regulator                      use open bypass opmode voltage current     min     max
  ---------------------------------------------------------------------------------------
   regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
   dc_in_12v                        2    1      0 unknown 12000mV     0mA 12000mV 12000mV
      vcc_4v                        7   10      0 unknown  4000mV     0mA  4000mV  4000mV
         buck1                      1    0      0 unknown  1050mV     0mA   500mV  3425mV
         buck2                      1    0      0 unknown   900mV     0mA   500mV  3425mV
         buck3                      1    0      0 unknown  1800mV     0mA   500mV  1800mV
         buck4                      1    0      0 unknown  3300mV     0mA   500mV  3300mV
         buck5                      3    7      0 unknown  2100mV     0mA   500mV  3425mV
            dldo1                   0    0      0 unknown  1200mV     0mA   500mV  3125mV
            dldo2                   0    0      0 unknown   500mV     0mA   500mV  3125mV
            dldo3                   0    0      0 unknown   500mV     0mA   500mV  3125mV
            dldo4                   1    0      0 unknown  1800mV     0mA   500mV  3125mV
            dldo5                   0    0      0 unknown   500mV     0mA   500mV  3125mV
            dldo6                   1    0      0 unknown  1800mV     0mA   500mV  3125mV
            dldo7                   0    0      0 unknown   500mV     0mA   500mV  3125mV
         buck6                      1    0      0 unknown  1100mV     0mA   500mV  3425mV
         aldo1                      0    0      0 unknown  1800mV     0mA   500mV  3125mV
         aldo2                      0    0      0 unknown   500mV     0mA   500mV  3125mV
         aldo3                      0    0      0 unknown   500mV     0mA   500mV  3125mV
         aldo4                      0    0      0 unknown   500mV     0mA   500mV  3125mV

Fixes: 8b84d712ad84 ("regulator: spacemit: support SpacemiT P1 regulators")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/regulator/spacemit-p1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index d437e6738ea1..2bf9137e12b1 100644
--- a/drivers/regulator/spacemit-p1.c
+++ b/drivers/regulator/spacemit-p1.c
@@ -87,10 +87,10 @@ static const struct linear_range p1_ldo_ranges[] = {
 	}
 
 #define P1_BUCK_DESC(_n) \
-	P1_REG_DESC(BUCK, buck, _n, "vcc", 0x47, BUCK_MASK, 254, p1_buck_ranges)
+	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 254, p1_buck_ranges)
 
 #define P1_ALDO_DESC(_n) \
-	P1_REG_DESC(ALDO, aldo, _n, "vcc", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
+	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
 
 #define P1_DLDO_DESC(_n) \
 	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
-- 
2.52.0

base-commit: 2cf7bc86f10d99b72707b1c1c654f78b103f2105
branch: milkv-jupiter-fix-reg-driver

