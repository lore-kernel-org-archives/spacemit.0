Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC6232F75C
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 16:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979122; cv=none; b=mysI7GOupj8vc6tr5xGf4kxTiJPU9jCEnktRb7gzSkDbw21ImsCXl7Oh/H0+jkfpGk43ndGvERcEmeiHr8YHXgIYbhvnB0qgc1lG2zmzjUaGIVM8uPN4H7T1tlG7obhPhe8vSkc6P3bOLA+drG5kqhx4LAfbEEdfr8NtfCsUFJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979122; c=relaxed/simple;
	bh=J4RnlkPmRis+4sZTPl73tqOpMLz4XTH3ddn132lst7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1rLU6ASucca7iIc2q3Nhi5wAq1asPbho3od0V/qpdFNGgltvtY4w5I0D3N1r7SF3+xKzhEjsLNfAtx4HIFk/e7P7d2ayu38CvBEvOhYo9VHdfdzCdyevjSs7ERdN7JgmADYfFAfBdewCaEL9Ar/J70Xsgkr0FcXICMmLgdyxy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wlbps/6r; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wlbps/6r"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-93e2c9821fcso400726539f.3
        for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 09:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979118; x=1761583918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuOxACCK+Imy4d0s9ApaTGaS6oXJ+8tFgrJY9fioEn0=;
        b=wlbps/6ryh0hifq4U59t+qja/e4Bb0utVo1dZQ2+B2xshGw+SuFqIDdbaU5ZH4xvwJ
         nRwCZcFzRFy/oFBeI0PoJioSxAbaO7SlISs3+S9blbk1oJ9jAJqS9bwousb/e4DGdGSA
         GqoqrYzCfyc1pF1UDlLL/IsZMFngi7YGDPKLsf6vCr3F8XsbgLvBK8tLPR5Gf+cHdZCI
         seY6FnNry95icB+EPl4rW4MC8shU9JcqZjZQsLwWlyzMeg7yF+7IDCQQBJzIjkxYZPvc
         9/InGFWGV3OKPARVHNX/THnJbneNWV7FKFTbqKfpwo3SmpBrYIyCAFW+flO6LwCyVUIF
         4k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979118; x=1761583918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuOxACCK+Imy4d0s9ApaTGaS6oXJ+8tFgrJY9fioEn0=;
        b=ZYQo1Y8Yfbhi8dkgaeqMdjAI93h91mXeqZVy0rUMxWoVYk28n2ttVPVRTvzHrCfaRw
         I4FvctxVCHerbHZOpUKA4vvTzmNnjjqBwKYSF2K3Pa2q6sDzBq4usQEuD20gBdOtaogQ
         xpolTdnirFIpVP+cxtaTSxIC/MD8zj37Dp8qX3rbyxmcbeWxray1oa9icJOvVGfBrjjn
         XiAAAPfAKveUFpYi5dNVmeynLFkpTnfu9upkTVuY/IGImlJUq8Z0LQsA/1+EOnHD7API
         E/u/GM94u5XgAROMgBDt9kUYTO3h/C0JaQ08RX4vhUpl4WgYk7DpsiE/a1cWpfu6ParY
         42rw==
X-Forwarded-Encrypted: i=1; AJvYcCVtqDlkeAp88RyaKFvRwJn4mFaSR3D7JJwIkfiG+pCx1vg6fh3vDMZJjbOLYMX62CAjDmd7/5n64g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZrKwE3H09NeXexZkWchz8qFpGtc6+s4MWOsJyu9xh5hG952L9
	YiZwqmKCawrUFsjdKJPzC2KhAGUEUh22Q3gn+/CR75d//5lU8v3lqOxEZV6XshIhp/k=
X-Gm-Gg: ASbGncsoTgxJvse+cagcV6UVHZ6zNa1ui6PpdeF5Tj1KjVomv+JJ7CUAMQtwGPo/hHQ
	9m5Z1zirettTUALNrv79XglfgIDINZi58aiUPJ8wrDbCg+pwwcxBnwsykwk0YpCkADaPayLnaxZ
	iyCSW4plva6Rs/yF11iF0rRK70RKhw7VgArKf6YIl1TBjOeEFxTkh2vi/LUnN3uJvHYP7zW+YSl
	dufGsLz8tSXImUSeb7ZWpxt55f/UZk5wOC+fZSA1BlHq7t5W2QuwfV+A9dVYaeMsSrdQlc6Wt5z
	9TyvwUOVnOQo8Z/tQIQOxKK63IbZoLXOu1w41JTxZjKkrw0RfAjif7InE1rZRuzI4heCf4hCgB7
	0cRoiW2S+Iv7zbcaAay163IV9ZVVMtZnFlrxr3g/0TLK/Y5TaJwWOTqKrZ0Em0CdxRLglDslmEh
	fldTi2KQOz/VWqHdATT8QSY9IB6irnekw6Ef5gMdXYLKk=
X-Google-Smtp-Source: AGHT+IEC4oh/Jnvhjv0NLxKRomMypLMZRmo/rR+Ffv9+T12KDSfiODwIv7xt26rVmqA6jr2VlWiOZw==
X-Received: by 2002:a05:6e02:152d:b0:42f:9dd5:3ebb with SMTP id e9e14a558f8ab-430c529a04bmr188317305ab.24.1760979118533;
        Mon, 20 Oct 2025 09:51:58 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:51:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: spi: fsl-qspi: add optional resets
Date: Mon, 20 Oct 2025 11:51:44 -0500
Message-ID: <20251020165152.666221-2-elder@riscstar.com>
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

Allow two resets to be optionally included for the Freescale QSPI driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index f2dd20370dbb3..0315a13fe319a 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -54,6 +54,11 @@ properties:
       - const: qspi_en
       - const: qspi
 
+  resets:
+    items:
+      - description: SoC QSPI reset
+      - description: SoC QSPI bus reset
+
 required:
   - compatible
   - reg
-- 
2.48.1

