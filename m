Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC697285C9B
	for <spacemit@lists.linux.dev>; Mon, 16 Jun 2025 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078304; cv=none; b=WIrwk+PdiMvrP4Pn5yll58VFryBitcC+D48mCPsXyHi2j51hj0xntiH4Bguju0UfrmFw/WiMmnqGzkU3zcquogbDFhTasX6+ZxZ/uJcErRQdQkFHDK+5sN9Y88lvLA3/d73p5UzniV5LvXXGqPR2jga2krvsWV1KJjZohltioew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078304; c=relaxed/simple;
	bh=9k9Wh/NoYsqbKlKsFE6tFkqP7y1xy/55zKbtVtGtJXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ToHqQSKk7hxBQUfRcV9phJBsF4SLUrT5V0+1QBLmjpzw40e0Jsne1mTkrlN7jsX6STBZspR6MYmAz3u5xcIHMp5JkrsVDfBb1pnjwRluTlU5n3GLhSMCvCTzgJpQbnntUPUiDtZc6IhMCo+vS3CR6znq736i+sIBDTMVu0BLL9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=a2x+BYt5; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="a2x+BYt5"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-86d0c598433so119018439f.3
        for <spacemit@lists.linux.dev>; Mon, 16 Jun 2025 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750078301; x=1750683101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/rRqga4nciTe+40s1lGUJde2Ttgzu3tg/+nM/gCFAE=;
        b=a2x+BYt5XQJj08cklb+ywTiyWzfz958TNNbXf1Wb2zQtcI2fJrXW5l4CqZf9VquXZU
         CcpsfTA8zLLoJkAtbHZkANaFzkVPBXOJ5hntjRo2IzQYy0jov0L1c27pzIXYIZ5QWdUf
         bDJB15bvDpVQD4u2lf8LNDsXpfcMqyjiKM48TGze+ORToba7jCKMIeE0tY9h4qLJ6VUr
         MpbMdfu4MYUTlearu8Anof4KBdNZnVZAebhPN0Sa6cX4iUVzYut9QV6aVctAballC21y
         VfwTnS0Vzz9tZzXA1RszZr726DO2T76vOA2NonGec8OzNVa76haHb7sdt4MjfHtBJ732
         y3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078301; x=1750683101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/rRqga4nciTe+40s1lGUJde2Ttgzu3tg/+nM/gCFAE=;
        b=t9e8di9U0GJXkxfWUavDY1skoejTdRngjJ/cG0UXTGnsNcHm/w414UZulU4xkZcAbw
         ra/BrLh7fh7a8bcf1AXM9fkim25sQSc41fT2TrDNni4O5QLcXiWQROISLBA08WuLQ3Id
         sztRHMb5NgkTxvxtIni4hl/bDLXX3Yjky7mrW6BDBrYTMIHZz64jKaztCNW22xXiwwnK
         kuZ+FAAyE2vbxXFFmlH2UYmRKXbQXJyxOmnom+h8/Iv7zEk31cggiqLexUySom266cF6
         +VbGIWePAcr7PhLM+KHKUmDywG2e5WuoX2RdGlMm0tSQYnn4Wmm52BJe5axqIvfO3Vu0
         BmeA==
X-Forwarded-Encrypted: i=1; AJvYcCVoHOBVObB3RCA6/cwmK6TN2NoiOmSheqRFpOzwtHrzvMI6Ez30mse1MFyneLYbZXUx46jsBQzHaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4skQPyhka6pkdkdRtlb0N8dbCOz2Tsx8TFj9NC0zCGZMaLi/9
	97PMERyDsKvD7hspE8ZTAZ3ZY3cr2hdYojwh22KLd3wq7iDMQRpGR7mUvEKXzZ5aq4k=
X-Gm-Gg: ASbGncvaeyzRFs8c/qEtiXVbLf+vOIQW0MpXgGConveVUDoq9RJ3TbygOvaCcaXg7P5
	Imtz6O91OWI1VDxPNtpE8iDMUI95npb0ZQLy1IZ6htVhNmpE4ZCnOvqkfF4usiHIXRZs6wrUXrC
	M526pEPZcXXJbWrIU02qG1YoJMvwqPKNLd69nFCjst8AJOPFvJSZ0/ul/Vl1jmINOXjHkUH0Y2o
	/Fs+l4nRSm+WMbK7wkp7GBJJJyxYB0fYuFKloQh+35rZUsOT7+q9asJ6Mb/mph7HcXHOAqkWoPI
	f9hnz5MEQlmZBogNcHADizP5vFMA4/TdeFPJm0CcIZZBZ0yMiUWH6Zs+HwXxD1K7ET0oasD6AUk
	yp35h50S9M+qjYi2Iel8j2aTE+zZA42I=
X-Google-Smtp-Source: AGHT+IGBM9IfcIVPXLIx3r77XwCbfXk8tkksQXCR2d/8SBqn06Uhn07s7o49RLoWiyjUv193p5+5QQ==
X-Received: by 2002:a05:6e02:1529:b0:3dd:cbbb:b731 with SMTP id e9e14a558f8ab-3de07c55b92mr92098655ab.9.1750078300563;
        Mon, 16 Jun 2025 05:51:40 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b442fsm20352865ab.2.2025.06.16.05.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 05:51:40 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	linux-i2c@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: k1: check for transfer error
Date: Mon, 16 Jun 2025 07:51:36 -0500
Message-ID: <20250616125137.1555453-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
complete, or if the hardware reports an error, it returns a negative
error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).

The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
which is the i2c_algorithm->xfer callback function.  It currently
does not save the value returned by spacemit_i2c_xfer_msg().

The result is that transfer errors go unreported, and a caller
has no indication anything is wrong.

When this code was out for review, the return value *was* checked
in early versions.  But for some reason, that assignment got dropped
between versions 5 and 6 of the series, perhaps related to reworking
the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().

Simply assigning the value returned to "ret" fixes the problem.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
---
v3: Rebased on v6.16-rc2; included version in message subject

 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 5965b4cf6220e..b68a21fff0b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret)
-		spacemit_i2c_xfer_msg(i2c);
+		ret = spacemit_i2c_xfer_msg(i2c);
 	else if (ret < 0)
 		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
 	else
-- 
2.45.2

