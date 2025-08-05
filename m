Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549927990B
	for <spacemit@lists.linux.dev>; Tue,  5 Aug 2025 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754406539; cv=none; b=TzTQtNGyMXVY8xM4Wxd808sDcJyHip32t00sBpf0Qujp7Xqk6EWD28sU/QAHKPrQT+SYgYvQN1mxRIDE5Pe4s95hI4GXc2fvYeYtCZXGFKeQvB+HH+qGyFEg1zAam5kxjZTQK3/t/Z6niDdPqVA/RpmpHe4oBnrCTOiDHll6pFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754406539; c=relaxed/simple;
	bh=6ooIakJHfw7YXMmRWfrQTaJz2DBq2g0w8g/ZJdwjlOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dqkHNRyhujxFqz0EImr3+lcrt1Thi2z6jVjbFEWOFChgm09d9+o2puJxSeyX8WD6zebnj0w5x9svbuut/+lQf3PERV+w5RPJJFZ6AUWir3WQbDzDaiEtspjeacTGlBdTwPa9tMCYe7fEHShw+dX8cOkcAJItqpy5vsqhscL59kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=sVkFCCSa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="sVkFCCSa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-459d40d16bdso17064125e9.0
        for <spacemit@lists.linux.dev>; Tue, 05 Aug 2025 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1754406534; x=1755011334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H1NFToLTMCBICwkF2bXpGG3zLl1KYY37VeQX64wTwe4=;
        b=sVkFCCSaqM4tQ21zm1ZTseBWRV/jgwSqJKRM21fidqXk8iMmhJiNwGaOP1MYMyM1f7
         XV5TUIzTK3xcRoRP+X9D7SGDCHn6Xx+u5qPS4YJr8XBpUoKyxa4OBnjtXO3vcBBdUdsp
         zcd68lRFlVfUiiXegtetjwRIu5skC2kFaIuckWhqGJTGST1Bq/EpAxCG+uwSedgv0s9L
         9fwoXOVO57XLI5h9S6aJTCzokOpZJBbwdpWmT2Ty0Hx4FJUhnVTr6i3uq1Ui0XnoogWR
         d+GSKOfdAX7a2N/G6SLsIuQNlhAfBKkhFxX4qIRHqXexVHEX/s33htXBiPuGsiYFetr+
         rwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754406534; x=1755011334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1NFToLTMCBICwkF2bXpGG3zLl1KYY37VeQX64wTwe4=;
        b=U8dLvNWDDAqJESOMedqoLbktMWPi7PnCD9wy7x0UA0LkWca82vJE4/H21plIdZsO/3
         YJeeDNKmnj66dwkccYelHtp8+2larmb2UJIo+rvwFr9Hb5+M2+A893ObWuwwrXKvWELU
         m7U1t0EmuPj3yzuM4jyz8Wse4hxWXIHFNsGAEMvqeZLsZvzvJYb+ub0mNxfoE/PBJGrj
         7kEZ6ouf2dKsOYOYCF4u0/iz0WT1u5/qaw9mIHc96GRM2GZEDIa2tBaxltFoX7w5rt1l
         hZMZ1ePaxA/5zWijPktW7YDaptDuzHvv1wRRkb8X/WyL+uz31Bz7eBBNaiEbjxN0gqta
         gdGw==
X-Forwarded-Encrypted: i=1; AJvYcCUhyWVKu3csQEShExnNsxDvxM1uzIJphQXTDcYO5m2MTb2rDSe9bZsSp2bQkLKsFgQfcsLNILI5cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvWKu5bjgPyjvLmCtKNL7Xw6Hlcv8p3XWFeMBIb65v83RyU4Qg
	8eHudChRb40LEtFN4q93EX0Il5iJbVIAS1TnWadO54Zk7cuWwYAUXyL0tAbpgU7Zwl0=
X-Gm-Gg: ASbGnctUKo4kQ+BKcU9eJMfFBgTjDW4r+nVpKcZbTodwelkMdpnUmQ0MWh7FS18JNV2
	QMoEk/4AO3d0IHObIUrN0hPH92dbbjkG1Wwm21X6EFnaWr+EBexOfWwcPiSz63bsntnzU5e4oYl
	7rcEbgeb3TZUAMvgpNqOW9PXcgNT5VrsAgv3+C2gUhqyPmfy/lN0Cz3yz5LLMF0Hlv4nX67r8nB
	AADYvhKlpa4RHmj//noCVp8wbDOoZ0GYpfR8WijVJcOn2SBZP0+O7rIJdepmxLxKnwVSHtBTxHD
	0pU/z/Vi+hcDmFeQTidTXJmB69PY9qW0q8Ke5CUlOQGNfxYt5nnQfQgpvMLbydpIo1faGwm2gbv
	ODQ/Awf04X+jC0JALSqMzQcA8kScdUugQToC1y9ygFcaQt0Wc
X-Google-Smtp-Source: AGHT+IFxn5pLwK5DhH3KCFQWy4nsv5vsgTiDMhFW15HhwD65qkQk4OJb8IifzI8vS1mm024ju4SDkg==
X-Received: by 2002:a05:600c:1c98:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-459d8c2833amr66948015e9.7.1754406534167;
        Tue, 05 Aug 2025 08:08:54 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:e77f:3816:a0b:2c4d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469582sm19264199f8f.52.2025.08.05.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 08:08:53 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: linus.walleij@linaro.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] pinctrl: spacemit: remove extra line in debug output
Date: Tue,  5 Aug 2025 17:07:01 +0200
Message-ID: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debug output for spacemit_pinconf_dbg_show() prints an extra newline
at the end. This is redundant as pinconf_pins_show() in pinconf.c already
adds a newline in its for loop.

Remove the newline to avoid the extra line in the output.

Example current output:
$ cat /sys/kernel/debug/pinctrl/d401e000.pinctrl/pinconf-pins
Pin config settings per pin
Format: pin (name): configs
pin 0 (GPIO_00): , bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)

pin 1 (GPIO_01): slew rate (0x0), bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)

pin 2 (GPIO_02): slew rate (0x0), bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)

...

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 9996b1c4a07e..fb361f2acb54 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -707,7 +707,7 @@ static void spacemit_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 			   spacemit_get_drive_strength_mA(IO_TYPE_1V8, tmp),
 			   spacemit_get_drive_strength_mA(IO_TYPE_3V3, tmp));
 
-	seq_printf(seq, ", register (0x%04x)\n", value);
+	seq_printf(seq, ", register (0x%04x)", value);
 }
 
 static const struct pinconf_ops spacemit_pinconf_ops = {
-- 
2.43.0

