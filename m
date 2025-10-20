Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48D83321A6
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979130; cv=none; b=mKibiGRF8nGv400KHJuIhJmrIC8vtSPwN6yPPp0dDBhsxa4/2kLdNGKab8i6ACDEW9fxw/IwvjJ4zkNcnMFNlY4Ovv4WwPqOHtTGTXWwf2M57yCZj7VFrDfEBG01aBfRVsnhcioA+dA6LOWYO2Q/IEQEpkDyNhN6OToiKMaXSv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979130; c=relaxed/simple;
	bh=CUgs8UQHsU0y7NsqM2mOtZAFUD3SjpR8SKV+TPlaJpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/y4PLnNR8sfga90swI5AwZdRDZo/XoQt0oWt2rl2c7NQVlmsNw9XW7LXEp8lqSze/3uCAeOEWpz80EPzblBWJ7j4MN7uEeaPhXYzlusnSJb1BGG7veqictgDPJzaGBbsUXxlVtBkoOovaeQECt48eu9FVKwUoqXJYx+vpyyRtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JBtpmH4I; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JBtpmH4I"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-93e89a59d68so88610539f.0
        for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979128; x=1761583928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTOagx7mvvjlab8+UNiNCbZ7xK3rTGi2vCmorF9bL6Q=;
        b=JBtpmH4ICfouEzjIJ80/wsEacrLD+CBACZsReyeoVU8Q7ZnBj8KDg/rL3BwzpigFMK
         VfelkQ5KZhd31ud6oyK4ce4RGOQ51HurCNB6tcdy8kf3daModKdbFOK7vth554Z9oxUX
         WUfSCqU1bTZNxTydXQVBemwQGKZyt2/Bu1wCYX2rBWf/V2+eYwSJMNt/H3Yf/l+R0nIb
         gB/qRPp9vk+kcxSvsbkp0jKKkC0vOwl04bz9OJQA8+dQSy4eoT4XUnCy0KVpNjaTNpzT
         REcbBNvuL0DAosvYgGh8rytIFv1cS+gKLN+gZSY3ZYwZcuI9wIQSrF1TMU8MCg/q/2jZ
         jSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979128; x=1761583928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTOagx7mvvjlab8+UNiNCbZ7xK3rTGi2vCmorF9bL6Q=;
        b=GK38uRnRSws0JhTNu2bD/xukXVE7I37IB0SaBGkJLtcizt0vrwbDq+CLRD7nbmibVA
         6gFqre6M7/KbzlbY6M4oUgIK6L6pS2O3gVgOZlQWpVihj6Wm5SEUEjlYRDtD8VE69tCy
         uIXWDmTaZlJEmTRMYKS8VR6BOW6lEnpjdvnzofKhnghUkLSfMhTlIU7cxst4GGaqtS3F
         QesGa7OhsZaFaa95Hp5epvqwl833iH8h2cAt4X3Osm7CtU15m5DnKow19dwVHycRO0OR
         f1B0+1J2heXiHrScGOb7zOxXBp7flw1xkqbon1g60nEqNB4QakF/B7dZf7jfY7RNKFN+
         4lbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD1ypZlYDyAxwmp2dAd9KZ3np5qjlpwXVYZ0cTTzPaYjtJC/F62+H6RZaFRpuRNo2+s9tN0QcPcg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo0O07MR0HD2roCiPHXm2x6EHAcb5/cZXSONLF+GqAyk8rJFyE
	s9bza7cle5Iikdt8hYCDQWJHofMimWddk1srGW0fcDUuCbUeXfb3+xqvaemMvYthxv4=
X-Gm-Gg: ASbGncvdm0a3nVooGlXzEwmCWt31b+bOQc8MPoDCStL9sqAqmjHd8k/189PAjGSi8pg
	Z/W4HeghkkXKFtHndoa+PTb6m1szZa42/1MQZbqqDxZPX6X1DxBecxXLWN9lOYy/35bqdnSKlFN
	t7OTWFnDwFm0hhJl4JRynK3zd3zgwheKLopvXysyxYE4/LBMtuw1hORCQH2XTOdF1JPENvetUbm
	EM4AMNbkVtY0WjBfTJ/zKJgGlotZj5DME7RSktw5uM4l5P+4yil5A8XAaVkAWX0XpSdU6A/YgTi
	bOJ8asJKjzXdR8RT37qCo16LHZxTCwFXYMt2qlDybZYA/Lym4iKljWTpXhsAlRbDT1GD04Vm/fd
	5zbvN4/O07R6VXy7pSDXdk5SREsfG8aivb+d2QpyMnj/oU6LRLhfR8C8Mabz3zKdqMrLYExujQN
	tVtyJVCo///TUnZjctepg4QfA+E7NDf6pswHFrhueL/IGnQgvBh0CUhA==
X-Google-Smtp-Source: AGHT+IHY1lIklOLT8YiqHf9RVDuR1yd+ypvubmcb+paaE3pfP/eJoAmmNPnDVT26Haw2R/FsMZwu/A==
X-Received: by 2002:a05:6e02:2301:b0:424:7ef5:aeb with SMTP id e9e14a558f8ab-430c526b27fmr218825965ab.17.1760979127806;
        Mon, 20 Oct 2025 09:52:07 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:07 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: guodong@riscstar.com,
	emil.renner.berthing@canonical.com,
	geert+renesas@glider.be,
	fustini@kernel.org,
	ben717@andestech.com,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] riscv: defconfig: enable SPI_FSL_QUADSPI as a module
Date: Mon, 20 Oct 2025 11:51:51 -0500
Message-ID: <20251020165152.666221-9-elder@riscstar.com>
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

The SpacemiT K1 SoC QSPI IP uses the Freescale driver.  Enable it
as a module in the default kernel configuration for RISC-V.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc2725cbca187..48afe30d42e88 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -158,6 +158,7 @@ CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_MV64XXX=m
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=m
+CONFIG_SPI_FSL_QUADSPI=m
 CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
-- 
2.48.1

