Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1EF2E62D8
	for <spacemit@lists.linux.dev>; Wed, 23 Jul 2025 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753274553; cv=none; b=RxPxGeMhzXZYlwCmr8vm54+MMSkxVF9uodHrbjxFlA3Eax0Q3AX9iZbsDklOqpd1KpJCCGhJMQoJj+HL2rG8NXAFnSyCeaY+NA3MTG2pQo5cKrAUXcK4bcuBnOtOempfQj+Cb/935lGFX6e5UJqV1jvD/OJfEJu3ashaaEs/c+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753274553; c=relaxed/simple;
	bh=Dd6wnE/Sf3IOuD9VVTmszqaQpg6KTb350GWEM4m2a0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EjiEm/Z0bE5Jr+ekoRHCRY9SQWobjfqjJh66G/c725nuH5UgNht3HiKf9Lua1aOcQLCQZvBY0ovK3CNfTSUb1ZCaC8iwIjClmBGW4bWnNWE2mjcTdp3vkvNXLLRguDqTQr9MK02jLc2y6pFub5Q9BS+eclpspbwxcTt0z9QCJ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=p/iXuWZ/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="p/iXuWZ/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45629703011so46175085e9.0
        for <spacemit@lists.linux.dev>; Wed, 23 Jul 2025 05:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753274547; x=1753879347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4veeSt022yF8JfTtf9KGz2ZcsYPnUB3umlBs+pcOABk=;
        b=p/iXuWZ/uBIlJ6eqsKxhZwkJqGaw9Y6zmdpzPDHdApf6eBfNFRWG2B5eHNR8J+Rhvm
         epMQT+qNw5BxFz19Ip0LrOCW4vTFMyCL7xlVzZjPlZmKVZJBnaiIxHuIPzgDohbctV4M
         XRC2FooLLz31x8rrtK1BcXCa+5t37XnDMPl4U6QvjBgAeXWqMSmSVTN0Xf52qCfY9TuV
         DCnHbhTISl7VjJX4Km4o0weAGlI5evrMtGe/HfeVNE4Pdl5D7rM+X4B+CwsDXgXBzCBp
         kB3O5VLJ3Y5SWjAV3co40AsrxnvLapDpASXPFXQxjyAfnJPQKZ55YXJ6dcDqSEiwGRD6
         c0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753274547; x=1753879347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4veeSt022yF8JfTtf9KGz2ZcsYPnUB3umlBs+pcOABk=;
        b=wwvx8O2hP6e6emWc+Bn4P23ZVNqu2luHVUH/dbc/0yqA8pmi2Kob07zmkNbd7OZy9c
         y3fV9/vpdj/xdhyxf+28qXrD/qe5nH5eMTiZSp3afYhOYOl7rLibD2WPGOp66rqFhx7W
         XJ6iMbKmVXJLoxKxYtqaVJA2ed+nNL6kaPCoNYjbR4L8cqZbUMxmlBX87Dobqu+rE/zH
         8EXJBb8s0vqXQdvdYTj4iPP7LZORic4RcYkABTYUWKSozMz2Wy8cLz2oHHDlNvj+6msE
         BAuXR2h0Fqf5Qpvyj19ayJjbvNmEMXG8kJd5K9HC4pOcnS3vS1TmxeTOMQn1zr0lpW+w
         HePw==
X-Forwarded-Encrypted: i=1; AJvYcCV3zIGOmB87Phv551tu8UpIMWq3i0yGIueVE3uNA0tfb8fhggGtDWt74iIBwke/LbwjZH72qww/JA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkpwZmN0cHtYwWjCLJ6qfwYH8Mw5HCqxhgPFzDpXD8o6/vkQa+
	O7g8FtWYz3+6VgIPHvNr2pkm7Hj10dEyQ+VmxJ8uCFIpMPD/vzpHNLZ4eSBmvDh972k=
X-Gm-Gg: ASbGncszFXxr5yZnDqG6xScRe7Gm3naBZBJDUZik2aCk/f+RSRahdCxUqFeCOi+vjSR
	gUJf7PzfaPcWOdkkVj75nln/JstNeaze/jBR2w4Kn1cFE+ZXxTI0JUqva25FNlQMEZRvTM6ogg5
	w0PLcBbXMKjK3SNAhnhoLCZwlIlmANZUbyyQdhgGRm1Wie4HWFvUyQAICHZzTm7+Uvfrr6g5ib7
	OJ5ag/YTWyU+C7rLtoYRK3SJcTP5Ybgn65Aw7uts9nTPNP/e2j4GQ7RFjCsxXh7PcvfXczpGfpU
	vx1NmhRQtVkz7kNBTPNS7JKXZXShTkb2k3b9ES6q1FMeA5VUF5+t13aQT1tWAolA1wxNTL8UTAa
	88XBCxP7/kH4N4cwbudWMrHjnNAoL+SXlOISXXNewXXYPUu3CTw==
X-Google-Smtp-Source: AGHT+IGbJ4sHUsE4vetWaUrzV0GCHvxK9m7lFsG6KCeg9nkDSwfu/KGJ+XeTwbxg+UQe31rImyB2lg==
X-Received: by 2002:a05:600c:4e47:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-45868c9d3c0mr26871425e9.14.1753274547109;
        Wed, 23 Jul 2025 05:42:27 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458693ab0besm22035165e9.36.2025.07.23.05.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 05:42:26 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: sboyd@kernel.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] clk: spacemit: fix resource leak in spacemit_ccu_reset_register
Date: Wed, 23 Jul 2025 14:40:20 +0200
Message-ID: <20250723124020.60897-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function spacemit_ccu_reset_register() allocates memory for an
auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
these resources, resulting in leaks.

Fix this by using the appropriate error handling path.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
---
 drivers/clk/spacemit/ccu-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 65e6de030717..5bb85e32c6cf 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
 	ret = auxiliary_device_add(adev);
 	if (ret) {
 		auxiliary_device_uninit(adev);
-		return ret;
+		goto err_free_aux_id;
 	}
 
 	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
-- 
2.43.0

