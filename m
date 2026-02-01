Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4846931E106
	for <spacemit@lists.linux.dev>; Sun,  1 Feb 2026 11:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769945232; cv=none; b=Wz4yHzreM3RMeRhGjSL/l7KbqcA8mLmXk3QxqLfXguAz0a0+4SMci2R1m3uxom81iU6jUCmjC36WVmZ8QDsgkssHgvxnFU5Irx4tThGMXhnHoy3fRShrchPDapaqZr5BWGUf5Ow8GphqLphlbrk3cFsVpaMLx9prSBCPYilW2zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769945232; c=relaxed/simple;
	bh=eI0E/QoLO392f2uK1RvS7txPilzfGEGYzqpuKQ6viCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlUvuKgz4SKIii4idFwo4g7UkCLqFGCFblWG4lBjTL+YiKY3L8KmCxn0VHA7pVCTeoXuDok0SoltEGNYbz0ZebvD492q8OW8j/kNwsALmx2QG1d/7YeWKhE9MOEn20U+T6N3N58KkqNpvB0DuH6RR3PpG30ORS8XVNajs0hevQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0F610341EB5;
	Sun, 01 Feb 2026 11:27:08 +0000 (UTC)
Date: Sun, 1 Feb 2026 19:26:58 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 0/7] riscv: dts: spacemit: Add PMIC regulators usb pcie
Message-ID: <20260201112658-GYA109598@gentoo.org>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769895215.git.gaohan@iscas.ac.cn>

Hi Han,

On 05:38 Sun 01 Feb     , Han Gao wrote:
> This patch series enables the PMIC, voltage regulators, usb and pcie
> for the OrangePi rv2 board.
> 
It's obvious too late for v6.20, besides this series depend on P1 PMIC
patch which haven't settled down.. Guodong is working on v3, see

https://lore.kernel.org/all/CAH1PCMYmK=cenJAvhGdZuh68fwNu-c_JJFpyztZUXvcOTv0YSg@mail.gmail.com/

> Han Gao (7):
>   riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
>   riscv: dts: spacemit: Define fixed regulators for OrangePi RV2
>   riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
>   riscv: dts: spacemit: Enable USB3.0 on OrangePi RV2
>   riscv: dts: spacemit: Update PMIC supply properties for OrangePi RV2
>   riscv: dts: spacemit: Add a PCIe regulator for OrangePi RV2
>   riscv: dts: spacemit: PCIe and PHY-related updates for OrangePi RV2
> 
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 235 ++++++++++++++++++
>  1 file changed, 235 insertions(+)
> 
> 
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> prerequisite-patch-id: 32d6acfcb4801407e38510b391407943e9a8ec82
> prerequisite-patch-id: ae644485e1a8ead3fa7a087c8db9062c7acc14ff
> prerequisite-patch-id: 605d537aa0f8387b3523786a875c76b9edfbcbb4
> prerequisite-patch-id: faab9c820ac67de42c40f2c4578bb5b8753fcb71
> prerequisite-patch-id: f9c4643cc99e5b9f1acc9daf1e679b95f81cee73
> prerequisite-patch-id: 50138c8918218ea3b8650999bd558ed6350ed2f2
> prerequisite-patch-id: f8f91e32361cc99c531170c39ed54cd1b3c5997d
> prerequisite-patch-id: 475d1968c0c41895578809410c9bd8fe24997de4
> prerequisite-patch-id: c40f1562f712f04578ef58472840d257a19919fe
> prerequisite-patch-id: e9ef3af6c80187e6f05444704d13212d3beaf40a
> prerequisite-patch-id: 7076909bb4103588b4761d175eca40bce470230f
> prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
> prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
> prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
> prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
> prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
> prerequisite-patch-id: ba6a7df5c7a2fa9ce0b8a72a9177e42a4dcdab01
> prerequisite-patch-id: 33fd23112b55b5e6b1e276594826ee454afc1c7e
> prerequisite-patch-id: 009a5aaff0768d90d148eb9d5d999c5098fd6d93
> prerequisite-patch-id: 7e41df07cbce163a689f5dca246b98a0122d1610
> -- 
> 2.47.3
> 

-- 
Yixun Lan (dlan)
