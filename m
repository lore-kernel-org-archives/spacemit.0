Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02483330310
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979123; cv=none; b=nJP+tTbobTuM/rty6JAxwrGJzzBW1b53nsX6ReAGlPurRz3hpSLo+5L88Ts25NB910Fz/FxDkMc+D6fliRUZ5mYcxAO/mwTFpRnyFKNo1itvc5qeluWt94YVsSbK0umNVoct9cJBvR9mE9iTwKQDnzn8XxRCWr7zg526MEAPDds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979123; c=relaxed/simple;
	bh=NVCZabHEL1WTH8+GxShWLpaijc+G+GBkOY3veIVd+BY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R7hIAhs6gcpTOo01zIjOTqbTyJpF1f6RYqnVq8ZHJu8zxfRATx/Yw7QZ6V1dwSj0vJ3TiFG4FFcxo8hPJlVd0vKFStzfBmLKbuEImM8ioPvnS966uunNXjup9+TD5NSBBpZMwcShkqI2jB9FJu/sqgS2B4zYxg7hfmbrlwe4G+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0+eqNWxU; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0+eqNWxU"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-430e6ac6bccso3501245ab.0
        for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 09:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979121; x=1761583921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AztIAt2eykX0RjbkZdmQk0KjjmCuZftCSORZ8HPCkE=;
        b=0+eqNWxUEQbiHGbgGy5ZuKOxmRtYc7qI6yRjSzaHmDXU+XdXGQuVXXBi+WWazpeGfY
         P4zIoLfKJJ3yhCy4lm8Dxre6NIKQGH7FHyu7TTrH3sd6rJBTTm+9oRzcM2mwIttxloY3
         RRmrr3I9XlvPEaCp5T86lHAEV4zfmQmdEcKiW20RZmj3KfDtX/ImQvF6Fai/K66CAw25
         lwNCDNI3hHPhG8LdHo+vpfqV/4h9iN+JieYdBcFictAalsej48HZxGtgOyN1uDXJ70Va
         0SCa2cnFYIZOxO071zBt5eNkdvDrp/g16N4HRvwlrqlom0ACZzpjaQtg+UV0n7twyf8s
         GDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979121; x=1761583921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AztIAt2eykX0RjbkZdmQk0KjjmCuZftCSORZ8HPCkE=;
        b=hMv6tBs8zzsmCKatvSyZLNRpevmJcZhMUOJ1Y40LbpEJubXJRr8EwCVrNCBiUR+ajS
         SbeOqQCkybXUswb9RY9k6lNYO3du1N8OkZjhhFLBkKol/PVD0hRcuUBDvXpCuD9jYnQ/
         P2paWe5SOf8e2yOaa/f9UDHde3X+FUMNE59Q++VyqmLIYlYogGQGzXyxtNj9aE/u3Vza
         IXbpUV9QI4866MIkQBAJs7fZO5UMT/5TxKDckW6UBhGRLirZqCTYOpagiyWt7Zh7gFrt
         bpe6qQcDQw6/Fra8qeKe6nQn3nVpgk8u0dQbfGBBNm8+WZ5ljNwL+1/P9KRkj8IcwFYV
         OrmA==
X-Forwarded-Encrypted: i=1; AJvYcCVzzgN/B+g1vSiifznYkGEcDPKNl/h4B9x0XG0jXYkQF3OnHJxY9duz7XEnsxxfSXrMNW0zH3OIng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa66UKzI6RHLUpjJ6YK2l6y2g8ReKS3LgOmRQghwcqD21mhA8t
	hA1thqjY1qdq7hk0aIRNrYtNaAlMNU4fkTkF4W3bqlCqANiS9fJDLiW8gtHd/foZVEw=
X-Gm-Gg: ASbGncv/NXLADU7lLaH6ACW6z+idt7BdHPOU4UXFf4rBFrS7ZNKyluP3k2V7pwcqOoi
	f4yXt0J38NgqjSMlIK+++KQvC33kHOOA1dRDS5vLYBuViSWpp1qaR0XGXcrBGlcyjMmA8s4DOLm
	ST+wv5wRoQlFKkDGPRwMJBaZbz4M6zfADLLct6ULNL47kFf1xy/G0hLZtcGSvmIRE4HkEm/uGal
	b9mbv1mZf4DdfS6wQYd32j4x5TD+M2ZKAIUGyDl/9pc/+gfRLNcjFdzaDL8ceDVde+mpcQRsCXA
	yVZ9wXJp/gbw9LQTs6BpSfn7FYpedpLqbfmBjf2zZRhAuly7nIRpY/6UmmonOPDHu4u3DeQWMeG
	EX0gE+kGl6TqqZeDc/NlfF3j9GQ9k091o6oNDDvaLhv57HdiTtT6EOBH5HPbsmUMFdo4X8hsTzv
	0DMx0l/hK9WVtaP9MnzUGwTkVvIt2mAlkAWBmizJeFdUIslaAYo6n6LA==
X-Google-Smtp-Source: AGHT+IFtVH7UjM/87oCHJ6DUbsAetp8PBWDPda8ZOgIZ6EU4bkSIEhABKs7/sgWo14aF9mEKEUu9sg==
X-Received: by 2002:a05:6e02:1745:b0:430:e5a4:6f26 with SMTP id e9e14a558f8ab-430e5a4724emr31688155ab.6.1760979121057;
        Mon, 20 Oct 2025 09:52:01 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:00 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	p.zabel@pengutronix.de
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] spi: fsl-qspi: add optional reset support
Date: Mon, 20 Oct 2025 11:51:46 -0500
Message-ID: <20251020165152.666221-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for one or more optional exclusive resets.  These
simply need to be deasserted at probe time, and can remain that
way for the life of the device.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index c887abb028d77..1e27647dd2a09 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -36,6 +36,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
+#include <linux/reset.h>
 #include <linux/sizes.h>
 
 #include <linux/spi/spi.h>
@@ -267,6 +268,7 @@ struct fsl_qspi {
 	const struct fsl_qspi_devtype_data *devtype_data;
 	struct mutex lock;
 	struct completion c;
+	struct reset_control *resets;
 	struct clk *clk, *clk_en;
 	struct pm_qos_request pm_qos_req;
 	struct device *dev;
@@ -857,6 +859,8 @@ static void fsl_qspi_cleanup(void *data)
 {
 	struct fsl_qspi *q = data;
 
+	reset_control_assert(q->resets);
+
 	fsl_qspi_clk_disable_unprep(q);
 
 	mutex_destroy(&q->lock);
@@ -902,6 +906,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (!q->ahb_addr)
 		return -ENOMEM;
 
+	q->resets = devm_reset_control_array_get_optional_exclusive(dev);
+	if (IS_ERR(q->resets))
+		return PTR_ERR(q->resets);
+
 	/* find the clocks */
 	q->clk_en = devm_clk_get(dev, "qspi_en");
 	if (IS_ERR(q->clk_en))
@@ -923,6 +931,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(q->resets);
+	if (ret)
+		return ret;
+
 	/* find the irq */
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.48.1

