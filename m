Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BAA205E2B
	for <spacemit@lists.linux.dev>; Wed,  5 Mar 2025 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741170444; cv=none; b=eCUBEUvSJsrITrjKx4BXJBW5MV0FBs68iGsJnd5qupApWuPWq5+Me0N/Z6oNxvD+PCvGdX2e2AXVHke//ykHbKE4N4vbrFugDo44jMg8MMhQMH+OvZVJsSOu6BqS35nr+tEnB/rXaU0zg7RIuzKDgPC3cYVeaUe+SevhmP8u+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741170444; c=relaxed/simple;
	bh=LHkL3KRuNaccS9Vjluq7eDHrzCRV9vjozDXsO9ZgV+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o3iZ86dmsLl6Ph2qNDnX8JBrwuJ5N04sm8G5iy15HNM/pg16tU5b2rQZQGyz6V59W4jaNoAg6OjKNEIT5vq+3lUAI7GfojTf/JdRSZGnzxLvaixwOdbgGFQGgclxRdRljZfOWBxN1AvJ4JEfaFxQFPigkq9rxsfP/FkeNthNOsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XmfQz31z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XmfQz31z"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43948021a45so60213505e9.1
        for <spacemit@lists.linux.dev>; Wed, 05 Mar 2025 02:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741170440; x=1741775240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCPKjpK6VO4lMEf73NVEG6/3JrmmaR4wPO/hIV6JAAc=;
        b=XmfQz31zF/2tjA4DybtKzyO1OwUXZd+BKdxAMCI1Hj9TsKptZjWyrVz7MFL5OExvTL
         sSo3wqgAkprMB0skGnwY/tYTYLsDcqbmFvIRNtFU6hW+JWFlas9t3zfXdGk1PbCtWuOo
         q+Srjwj6fRMLf+4ag2jRtmxaGtudpcSW/WjsTDx9WaMmEjF5y+zmnmUySnqYdOAUA8xI
         K3sM0mh3otYl7Leqv2r1cMdRT6EPXVb9OWxVUX0P3lHjNKtg+u1SQjtnTmyM7SPGKO7R
         X3xAPrbfTNfvGq4u3NbImmB5Hd3yZMTCSToL4ZPek1+ERjFTf5IM5jJxduc8AVqu6dEy
         WtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170440; x=1741775240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCPKjpK6VO4lMEf73NVEG6/3JrmmaR4wPO/hIV6JAAc=;
        b=okzVok9H/9DuIMrSWIlQX2WUrzEBx5qBKn6WhraolcFa9VWUIlqVf0z1BY23AqUnaG
         VMW4v01n6NBOGQL7M7tPT89an7AEsJ0xdLTaiEr86KRfgBqPtGq1iJ5dtIaZwhKNg/v2
         NhUgGl/FveuTGsCjvSMyTqpZ0eXasZlz7+PsGHvhn5CE4pBVXAV5ha6pxhyjxqYZRYFG
         0qNSAvmaygFZSvoSsxBUNcvTZ8S1mBjf1K+bqfyp49Uzz1cHsLLwxPzwtxNnzY7Aky+z
         Xt6myXftN+wXmQE59i0Uoi0sK6CY0pciPGB6M38M0hiCn/Z1uv0Ctyu9NETe6BC6KApD
         SSHw==
X-Forwarded-Encrypted: i=1; AJvYcCXz5WWEFtmW/oGKTLDLdegOWrih61YB12AQ0znuav7adbpGYKRwZS/nOx9jlp8qjcJXpavZ4dvXhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJEUmhsFx5S9khkGuRKEw1HVObywIpFF5bDUPtCyXV2KmJCbcp
	6MNXVV66I83zCOyXf+OoQdY9gWxgA7oyHLlD3AyioDqds/SpRgGym5i2OmsIk48=
X-Gm-Gg: ASbGncvAcCovRR27knm41XS5szm1dr00n9AEoWgcPykJCqRBpLxQ2ViakupE1k0SkPk
	esbE9X/XYonLoejLyMG1sU0o13aKFZKxuAn4prMx+qQNDcVNzPC6otSS5CXyW4DpPWi7tBwwdZV
	+x/sWs5Fnua/Ak49YrHJaSgcFIjcl/vXgtZgbYvS4W4BLeX+tansGJAzKYaYcMl5CXeOUYXM7AU
	EnCogfnq6R5zL4En1+xzpH7WIYsXk7oVyYghaIVJGF1L0NJxwCuQvCBMhj7yCxVfHjpwKegFTG4
	xD+706znR3gxhjsCZKYW8Zn9LVNh+M3fGzwaOHMvXXVm
X-Google-Smtp-Source: AGHT+IHMvKES4+39p/GD/gutXcsrB/9GUV4+AbW8RNvVpOWUIzKEe0uSKYCHBVcKeGfHAgKJtsSHgg==
X-Received: by 2002:a05:600c:5120:b0:43b:c316:1fee with SMTP id 5b1f17b1804b1-43bd298f96fmr19612845e9.15.1741170439670;
        Wed, 05 Mar 2025 02:27:19 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e514:53b3:5af8:e408])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485ddedsm20185004f8f.89.2025.03.05.02.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:27:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] pinctrl: spacemit: destroy mutex at driver detach
Date: Wed,  5 Mar 2025 11:27:10 +0100
Message-ID: <20250305102710.52762-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The mutex initialized in probe() is never cleaned up. Use
devm_mutex_init() to destroy it automatically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 59fd555ff38d..67e867b04a02 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -9,6 +9,7 @@
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
@@ -749,7 +750,10 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = pctrl_data;
 	pctrl->dev = dev;
 	raw_spin_lock_init(&pctrl->lock);
-	mutex_init(&pctrl->mutex);
+
+	ret = devm_mutex_init(dev, &pctrl->mutex);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, pctrl);
 
-- 
2.45.2

