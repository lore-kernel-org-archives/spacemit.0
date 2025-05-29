Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7960223703
	for <spacemit@lists.linux.dev>; Thu, 29 May 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748521354; cv=none; b=sB+XNlNpFTQmRFpGYJTz2Ny/1ZSiswDF+vzuCu7gdeyF40cUSBtCqYfqhkt/lPDcnVYR1rx18WkIDUBYf7B0Zid9l7dsCv1Qgu57BUoelGIDUPXBUH+nYrXd6iwxNe3HzXK+XZyvUruvn6wcWsF42hDUpfsQbXv7hPCIbzV1hvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748521354; c=relaxed/simple;
	bh=8Q54xoWFm5dD4JeLp5GkvQ1SCkN6YSxoGPXQB+KAnIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a3nabaCidcVxOlxm+m5BGdtedE/HlZqgCO+FuI4hr/SDcOgzqJrAtm24MVXYEHhBsCGy3UfVY5P2/jLxbWLPE9YRj1Ez79BiSar8kG+O0vpFq/0URlWqFMNvyPKQmG5Ms5hfcyZArL4Vtlvt9HVN2SmHiHw3b0BKf8GHplKMpjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CbwA2O+A; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CbwA2O+A"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f8a70fe146so15213686d6.0
        for <spacemit@lists.linux.dev>; Thu, 29 May 2025 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748521351; x=1749126151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfZYXxSa6TDC4D9WbSYlB6mVhhaETHCcZWNW+QLW+Ek=;
        b=CbwA2O+ArgZy40RHcYTY4UtRKx1G+e8zk0vclQB+NqZ+jMjm17pnD6hek8fUZWUSdq
         2EvziYTteoDG6gFJgw6U9z+W8KYU63mUUFU2Urbg9pqkDhMxEMJMQbSN20TYtrAGm+s9
         I1ck6+TX0LCslKq49qDPhgErv62Uik5XtkRis55ngoAMcJZ5OCAkXTytSH6ssIZmbPwP
         e0B2zydPZAJFDvSsMw/Psj4mxGhk7WBWrbO2gIXTmsI1jYNQ2BS4bLWjU/XsPJTKON8V
         DZcLgkLE969sfaJR8SUgFhz++a00t85gjT+jOxQ1sPe6uPKhUYra2MicMIQk/5pN0b+V
         /ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748521351; x=1749126151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfZYXxSa6TDC4D9WbSYlB6mVhhaETHCcZWNW+QLW+Ek=;
        b=UEfJUXHV9Rh0UxCT805VoFp3XEwONhmd9YgKx5mfEDyVeekKX0bVdnWDBKRE5pxXpg
         QDAETIpL9R6v7fKY9J8LgK7nzZ3uq6FDAcciOuX6Yq0xbTq4LcN9nGStI8ViG6ZwcCnN
         J/MZAwKh4Xg/FHryXHY/bLCp2O52CWADwPYsWCG4US3akgKq04k7hvtbsTWEK/GHftJr
         c8gwEapVj67wQS4I50684vpAnGm18UxTME3i4n0G/ExLQD7SaWDjgbJrDLK19TvbVJxT
         L9Cq6igm4m/ygeRdj58dmczc+SO3gg6sZQ/WFGT7KZlIVICCm7HwoATRDJf6wtTt0ZPK
         YAhw==
X-Forwarded-Encrypted: i=1; AJvYcCUrZEm/h8u2cFdvr55hGE1fcfwQBFXTWol8XwGYwGJyAF5UnsyRlZWtBi04liMzE0zuzeraqNv0nQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcFN4fnHZZScTNVPNgil5O91icfpgBEsWz2nw8A2bI0o5Zcfk1
	pAyh+7ieZEInz65WVv08y5n5o2Yk60x5frROzk6tV/1WObLPvVH0wtTqQUtO4qm24f0=
X-Gm-Gg: ASbGncsgFcQ5NxthXqf5dVBmBUMnOc492VBjwk7otSDAsot6wUWJsXyL2VBm2x3h9kM
	1HXoYMGqh8icLJkbwAQhIwliiPz2MfkLO9JQRjuTE4BBiY9FEC++gd1BwWJRZ/CGkgRWd19IDGQ
	Wi5IyRFZv8Pe0WwxZYZFi0I9FQIOmTNLSDUaG6Rx96QGEbuvVFWiQz52OoKZ0jA81bMxhTAqw4l
	1sYATSl7uA9MtDCwemCm7m/RvnzT1BzvPt4BxNNxkGIo7uovrLdvLcCHdADRmQaCgpEYYGJ94eG
	vewQWlMJAJS9gqfQVkqZmOxWxnThc5Inbqj8Cytco+HAAXTYjWnb4ORYfDUKC4rKokQNnPImxjE
	40Mr1mUW7SFJyF1dzNb8Qpg8B
X-Google-Smtp-Source: AGHT+IGKJiOHPciyv3QtiOSyy/RZt9nsdwc7fAQpB3gb8J6aM4q7mvFoREGf65Wv1z/Aaq14437gYA==
X-Received: by 2002:a05:6214:212e:b0:6fa:c44f:2ae6 with SMTP id 6a1803df08f44-6fac44f2d96mr79427466d6.38.1748521351418;
        Thu, 29 May 2025 05:22:31 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d5bd30sm8814346d6.67.2025.05.29.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:22:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: k1: check for transfer error
Date: Thu, 29 May 2025 07:22:26 -0500
Message-ID: <20250529122227.1921611-1-elder@riscstar.com>
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
---
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

base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
-- 
2.45.2

