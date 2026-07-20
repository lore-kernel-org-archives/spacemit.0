Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761293CF211
	for <spacemit@lists.linux.dev>; Mon, 20 Jul 2026 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543778; cv=none; b=I7LhO+z3KQCuwxNk1MhdWKZ/dQmkhFKEaJD0GtgDYHnyOf7kZ/iRDw2C10Dvi0qX6tmPbk4aWcnfbZ4EkBA+P/y39imuiYgku542NIvheFqhoi3sle6UoLvSdlGdgxLejOmvzrh/U1YzlHavYUMTeHdRJpVcDXNoQ0umlJfT1Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543778; c=relaxed/simple;
	bh=me5QHrqM02UHPXwABM4TQ2szLl1FcOkdKMdKCXza+sE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DHM9N5L7YXSfT6AbmtmLHiGPvn2246EGwzxW8dQPSvPZmBEeiRKNYeCdYbxg5b3FaMzzHYIi8Kajsl349GnVu3TntE0HcwHQsBsFV6oj4FzzU7dHGRpSj7DOH7oPHrSCNA+nvh/M0rSOpfvjMHvHWnBzcuiAO2bS/Tr1C+YjNF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+r8famv; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+r8famv"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so1782412a12.2
        for <spacemit@lists.linux.dev>; Mon, 20 Jul 2026 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784543777; x=1785148577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oqW8KaEsXv0dXUfcgcDqMh+LX2DCloRVbZb54sf32E=;
        b=b+r8famvkVHlvkDFnDRQk3PVcGPz5IkXY3wCDCTRZHDRLKF0tQwYZ7EzD3ZTfaIvVm
         sUqZROAFsvCmjs1W+XC5+vtwqTspkMmWwhuPYA5bUSU+ViXfSXbQwUPRuR44GigW7MN/
         pMIKsTaGyXHpw8y/NtXE5tTb1C0yZYvcUutOHSl2UqfhYkBdlLHNrqCwOez+vGQhX8a0
         l4u+bf9AgHbJaL0Y3IZm6L2EjnvXrzRpaxnXm+iW8NkKHie2VHfBTxwXX/bvQbvugbml
         Dfz2RvbyO7F8CELx1lCPGBLFeO31m045BDd1RrxLNYGVQZtlelIewJvgDZ0xC2bsYajU
         CLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543777; x=1785148577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oqW8KaEsXv0dXUfcgcDqMh+LX2DCloRVbZb54sf32E=;
        b=HQoikx9LSVQ+M9G07s9m1LH/G31uAQniahp71irysxNUdVhw8f+ytE8U3OsG28jebV
         R2fDO7z0gOY0gQ5OxHLi7WbTgI6RECLMwK4Zm0sStC/qIpYEmoxCU4ZZH32plsfkp4VU
         OLqdtW1TK9dn7St5ll72ekgq8E7icQz3KzdIkKs7FQUryfmfaN9YzmT/i+5wSKPcKSMM
         ZlGTneFM+UuLarKir8RjwQaIZeaEX0FdF1tCO06JbD4aSONJhmhwlnJFbTjU8ySBzqfm
         O+iCn6zUzZ+DrJcdvBnug/7I1LUtNiphvQ4+cxmVy2ZI5liJAUQiET/TepS2pGlOmDkZ
         sQig==
X-Forwarded-Encrypted: i=1; AHgh+Rov4iZyKxleb4GQ7unmJaQzqCmC8YwVx50R9VHe0+jc+W+p5t2+SDB55eM80j4G+JT8QhFjP29+7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3DU7MmgEYSD5PdZdEmclNiILjgXZVYgUXifKythbAIxwxdbOB
	gOsI4c5527N3sGOP4kINybOIJBcyE7QznwrWVhReWqfJiCZURjsWoWQ=
X-Gm-Gg: AfdE7cn2ePbckRPcmVCSRaY5wCg39hehPgK6pu5tjhQAk1mjvze6l10rQGeFQj1HW29
	PyARlKtk3SP3R+D3hl9EI69evg+drqu34MfWeleGKL64qOldIZ+FKfZItpc3xO2jjXsoR2dY1fO
	wuIAQusaQsl/jLujr5/PgazSCQh2Ensx+xXUW8ho4swaSf5WQk/YnKeGgfVuyRS9/4fZ+P2L7vO
	ORzu18r5/C+PQtMBAtZRoZGADZNda6PkAtxLAeZtx9FomutEOTvpb1qxpjZ9qBcDMdTwhXOlQK4
	cK5X9kTjXyD2f5qrxVEWNhWSrkVlQunOS6j0MPr5/xJg7PgUnie5WPGoON7oPGf2z7keKSGTWfF
	UHt6Hrn5BEJPaoSmOPwKpClCH4wPkax5YFWyQOs+vTxEucbpZ9LA21kYOQPhOQA0VKXW4gyLJX2
	8UnOcaRw0TfSx51iK6Yjd+NabDdg==
X-Received: by 2002:a05:6a20:728a:b0:3c3:a1e6:a62a with SMTP id adf61e73a8af0-3c3ad99c684mr14396156637.63.1784543776540;
        Mon, 20 Jul 2026 03:36:16 -0700 (PDT)
Received: from t-rex ([2401:4900:c200:8f2e:8d2c:f805:595:9600])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429ff04absm32697446eec.8.2026.07.20.03.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:36:15 -0700 (PDT)
From: kr494167@gmail.com
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	dlan@kernel.org
Cc: rui.zhang@intel.com,
	lukasz.luba@arm.com,
	shuwei.wu@mailbox.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH] thermal: spacemit: validate clamped trip thresholds
Date: Mon, 20 Jul 2026 16:06:06 +0530
Message-ID: <20260720103606.93924-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: surendra <kr494167@gmail.com>

k1_tsensor_set_trips() checks the requested trip temperatures before
converting them to the sensor register representation. Distinct
out-of-range temperatures can clamp to the same hardware value, leaving the
sensor with an invalid low/high threshold pair.

Validate the ordering after conversion and clamping.

Fixes: 296a977f2bac ("thermal/drivers/spacemit/k1: Add thermal sensor support")
Signed-off-by: surendra <kr494167@gmail.com>
---
 drivers/thermal/spacemit/k1_tsensor.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/spacemit/k1_tsensor.c b/drivers/thermal/spacemit/k1_tsensor.c
index 79222d233129..a9eaedefdac3 100644
--- a/drivers/thermal/spacemit/k1_tsensor.c
+++ b/drivers/thermal/spacemit/k1_tsensor.c
@@ -156,13 +156,12 @@ static int k1_tsensor_set_trips(struct thermal_zone_device *tz, int low, int hig
 	struct k1_tsensor *ts = ch->ts;
 	u32 val;
 
-	if (low >= high)
-		return -EINVAL;
-
 	low = clamp_val(low / 1000 + TEMPERATURE_OFFSET, TEMPERATURE_OFFSET,
 			FIELD_MAX(K1_TSENSOR_THRSH_LOW_MASK));
 	high = clamp_val(high / 1000 + TEMPERATURE_OFFSET, TEMPERATURE_OFFSET,
 			 FIELD_MAX(K1_TSENSOR_THRSH_HIGH_MASK));
+	if (low >= high)
+		return -EINVAL;
 
 	val = readl(ts->base + K1_TSENSOR_THRSH_REG(ch->id));
 
-- 
2.55.0

