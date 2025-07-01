Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8981025EF97
	for <spacemit@lists.linux.dev>; Tue,  1 Jul 2025 05:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348306; cv=none; b=CfGB6b8iBqQq+KO6k67QyooHg6fFBDEPnuNpSbsk6OteYfFucoadnx6KSjgAjRz7f7cMerVt0x5NBcOEplftf/B4Ms/mI3J1xDtXylCM6sg4XJ/nywzcDWvwjpVc9FJZuKx2pdwVi/tHVIttnnP7imxlBNYvakxs3EduN7FiqKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348306; c=relaxed/simple;
	bh=cSpWpN4ROq4hNgdz7Ah51Oslr+OjvYL60oNVPcd1qRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tvm7xlPersMppbT7oMQ8A5pBxNtcoJeaABmRzQYYL5+xGSPMVa/CnDs8HSmXL/YYUl7f9fK6TAX49ktGqYAPkw/wd4pZBPTPP9GCFYFc+R5qwnbX3rUId7xN4yIpzBV/9DOiAzTv8KHX5ktoRX+KSpAGawbvY/jKv3oT+FG6Vfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=U6A6wzJ3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="U6A6wzJ3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-237e6963f63so16774905ad.2
        for <spacemit@lists.linux.dev>; Mon, 30 Jun 2025 22:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348304; x=1751953104; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkkyJkVw0bfJeEfuvrb6+q04bt1dqt1H1Dk83FQ9SZU=;
        b=U6A6wzJ3udQxATeZXWtXMDFFdeLaMnPvlxggGl2tdjKXnU5FXgD9+9L7YQYyuCyqbd
         9OaFQfgtcFxjzZBB2ezJaHRj8RfAjxc5ozTedlxM3e6Fykr2hnXimeOJpuB6V9c8qdvF
         PVhnorpt8i9SxK55ekMpbbdUylUKplybknOp5E4RQ+cKVgjAB5yNsTU3K2OhMu8yQxTJ
         Eusq2aAxh/bpFefPSsRNt7ir4xCTBjtgW2JklRlg39mztYaBz+dfHIrdZ/HDsd038I6O
         F9K4OWQuJ6Wi0/gsW0aWKToAoa5tchNBG7YDX8+1VxH+wHRrUwDf6uuV4hQ73AkQ1JJP
         45Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348304; x=1751953104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkkyJkVw0bfJeEfuvrb6+q04bt1dqt1H1Dk83FQ9SZU=;
        b=h+ug89V5y72aZPC+XnSgWhHZ4cb3BZkzaGEwsq6BIvZxM5ytNVVB8JNl1h8OOg2dd1
         duRIsJsW8solA4F7+KxylsncJy7VDg6BLI1qh4SmAFUtcvD2OX5NRC7cKqtpxIB5Gzeu
         EJTJN/qBH19Z2MiFEjJAOK5Yb4FXnXjGAWYbCLZyBieuZnJjna6Liw7xIw2sU0aduQfZ
         4bbTwvf35Iej3Xm2rcP3BQZ0lc7i9+9tRbcm/JnhODh8Ly+rbBUBjmvPHVItGb+kjgng
         l5ndz/YAte8lvLQHCpROiFX/AXvbqyBn6eOHjRTYso5dZ+a5RVaoNPQ8BQ4fzJ6vmJaZ
         R7gg==
X-Forwarded-Encrypted: i=1; AJvYcCUIv4PmU/2+LhsGoJzKh8jBXFKTZxcVB36xzCzb3XSXFi1m2t/JXK3+9cBNyzj7HvimMizMrZzkYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuwlDvrp0LI6PssT5yEcFsjghNda+LRyX4P6KKzBd09mrGGdwB
	xU2RWmuKEhIpIuMIEw23u+kRmGYh4uYbDRnLs3+LdoyRawr4UZnCXwfhFwTS8A9F3/E=
X-Gm-Gg: ASbGncsaHVzFe592BL3w58zvECkz7VJYPrMvJmWjCstK5oADGugukkcwd4RloNJgLJq
	vKfYy6M/FQty/ysZh1WI1IABt+TnqBr+fjYI2/ozt066e6o+dQkwN73kj0tUPAcP77dJteiq+7d
	tnl5qOw8r+BpZCXQXKgU6DEL25mYyxLxnkOr96mybFCvUNxu2f9Am2OXqYEUCPoGvoxt/nRYyDq
	jd2abT8W7j2TU9MeiPr0clxbXVbNd7w2SufGuQ3oNp0nX9cMcdSwGhLKuI4XyktIz9YRT01qwvU
	eTvCTKEGDeMX4wrxQqmXnK5y15hHaytoe46IAGI=
X-Google-Smtp-Source: AGHT+IFV0sJft9TTbW6Dof5c+OPMKTEfD4ooz1HCHFSKDnOrbvDpDaREUu+dR1A/ELAjaCh8Jizt9A==
X-Received: by 2002:a17:903:2983:b0:234:aa98:7d41 with SMTP id d9443c01a7336-23ac4685adbmr249282415ad.42.1751348303953;
        Mon, 30 Jun 2025 22:38:23 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:38:23 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:37:02 +0800
Subject: [PATCH v2 8/8] riscv: defconfig: Enable MMP_PDMA support for
 SpacemiT K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-working_dma_0701_v2-v2-8-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Enable CONFIG_MMP_PDMA in the riscv defconfig for SpacemiT K1 SoC boards.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Rebased. Part of the modification in v1 is now in this patch:
     - "riscv: defconfig: run savedefconfig to reorder it"
        , which has been merged into riscv/linux.git (for-next)
     - Link: https://git.kernel.org/riscv/c/d958097bdf88
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 37c98c0f98ffc0ee9d021e4d07aa37a27d342f7a..b6519fcc91c0bb56f71df336fd3793af3d64fe78 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -240,6 +240,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_MMP_PDMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y

-- 
2.43.0

