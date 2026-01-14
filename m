Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8C2137930
	for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 00:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768351671; cv=none; b=uStKZnZhWawqVTzwBjMqHfxxAlt9OanhtE+hJK8RxJ+XvZeQhrIIIyxJk6JRYLPKhd6bj5TNk8RJkS2X3BLLpndiC/HjzPqnXTw8radSKPXfZEhIyAv226ncnw1gbtb2GKyAagdo/FzBmsBk3xHwq2sOcZBprhaLrYDMbm+b8iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768351671; c=relaxed/simple;
	bh=F7PRGfzbZFNFqXLPAvX1nvariK6Gh2gtLkzBXyRb/b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KT+1WNA3GqBnQQEUjPKsu65rVWviV8eXpK+3HuJ5vXURjswLGw40MspzVqytr/4v7txl7J444QqXNgWU+pQL0MZZyDripE15nos1StL5Ufae1PgGBn7uAbNEo9fnFy49vqXygHTL9tFU6e6vFGILObC0aloAocxU1pBUFVzj2C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 41FD5340F92;
	Wed, 14 Jan 2026 00:47:43 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ze Huang <huang.ze@linux.dev>
Cc: Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Date: Wed, 14 Jan 2026 08:47:36 +0800
Message-ID: <176835146982.13007.17884535903013126936.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
References: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 11 Jan 2026 14:41:01 +0800, Ze Huang wrote:
> This patch series enables the DWC3 USB 3.0 host controller on the
> Spacemit K1 SoC and enables it for the Banana Pi F3 board.
> 
> For testing, the following kernel configurations should be enabled:
> 
> CONFIG_PHY_SPACEMIT_K1_USB2=y
> CONFIG_PHY_SPACEMIT_K1_PCIE=y
> CONFIG_USB_DWC3=y
> CONFIG_USB_ONBOARD_DEV=y
> 
> [...]

Applied, thanks!

[1/3] riscv: dts: spacemit: Add USB2 PHY node for K1
      https://github.com/spacemit-com/linux/commit/0346e7284c2a1a39befc8711e5bc7f0306df7bdc
[2/3] riscv: dts: spacemit: Add DWC3 USB 3.0 controller node for K1
      https://github.com/spacemit-com/linux/commit/4b8fd1c95f0dd0398da1ea373ab67dd3559afb31
[3/3] riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
      https://github.com/spacemit-com/linux/commit/2c1c8ee2c30f90b2dc2d6629e364aaed622c98b6

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>
