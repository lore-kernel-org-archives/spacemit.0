Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183DD405C57
	for <spacemit@lists.linux.dev>; Sat, 16 May 2026 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778936560; cv=none; b=jJjy9jHFg27KT+JfuJnLQUu8aaFICUT60PeWQZvWR49EizAwRbuDJvWVV22agbEfWAyf1elbH7WpPTOk8+T3rw0uTH6iUP4gUjUTa3v77I7BUNIAXUCqMOXY5hTnUbkWbyeFFWrGTafRzPVKbcgCUZkRL+fHQGb7B3mLKc0bKNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778936560; c=relaxed/simple;
	bh=77WaUoBwjMQHCX2qPHR6NX2pZr51q4lprREyCHkAjTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUFzGGRj/WC7ZuHj2g6/cFoyU3Kk9csDNKxUJbZ7DeAl1ZjKkp2rzXLO7gecFhIoCZCJskbqvjD2YzqDjRJ15q40zyT3CJGqnWEWaMRKimIoFxULiP5x1w09ciRafhXEJc2Qol17jp0bQd0raIf16LQf5u55l2vPFI0rML/xVDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwCfYiyD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwCfYiyD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E40C19425;
	Sat, 16 May 2026 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778936559;
	bh=77WaUoBwjMQHCX2qPHR6NX2pZr51q4lprREyCHkAjTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UwCfYiyDrpFAVnKVDalO3HQMB6WE5lq7yBA+YnGphpY3dJ5xCQqaHYSaHBolIqRK2
	 oDp0x/bC0xqWZyFyoAyQtkMcwlz14zHPkzoXUnSqenKhVF/Wi8wZSXDnvL8SMHxy4G
	 SXXztuti4dS+YHV7AQeTezGVYVXCK+IbrdaEGAudFh39kTZ1vIo5s9Z2t6vLv4wXpX
	 3BDt1My+XJ0t013Fayjw3oZsUBJslXUax6MnONM0RV+7nL8UAOnfNY+ItFgjpL/p9i
	 sD45/A2IKuw8KYzweJYU6Cj11yWKBaDw+X8Lk2AFtM/gppJSphvnMfM43I2WfOYtlF
	 AAjHjzFgpHQyA==
From: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Andre Heider <a.heider@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 0/6] spacemit: k1-musepi-pro: add missing devices
Date: Sat, 16 May 2026 13:02:31 +0000
Message-ID: <177893645572.2456461.14638110391927688410.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 13 May 2026 09:19:48 +0200, Andre Heider wrote:
> Add the missing devices with their required regulators. The regulators are named after
> their label in the vendor schematics[0].
> 
> v3:
> - drop reg_usb_vbus, non-controllable and served only as vin-supply
> - fixed regulator-vcc-4v0 typo
> - fold addition of pmic regulator labels into the pmic patch
> - eeprom is a GT24C02B, fixed commit message
> - added reg_qspi_vcc1v833
> - fixed uboot nor name offset
> - add missing "reg_" prefix for reg_pcie_vcc_3v3
> - drop pcie{1,2}'s vpcie3v3-supply, it's already specified on the root ports
> 
> [...]

Applied, thanks!

[1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
      https://github.com/spacemit-com/linux/commit/e2dac7c7a3a8970feeeb758f782ce86b89625ebd
[2/6] riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
      https://github.com/spacemit-com/linux/commit/6bc75cfa56e885c2eab80e215f0a610075505846
[3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
      https://github.com/spacemit-com/linux/commit/735b1b205d07bf7bfa55b1f50f5485b9cc42a251
[4/6] riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
      https://github.com/spacemit-com/linux/commit/83c658c7a82304a2bc944cdd4a5b4f98d19322f0
[5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
      https://github.com/spacemit-com/linux/commit/d9ab0a855ba13f1db3ae16539348714c74010a22
[6/6] riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
      https://github.com/spacemit-com/linux/commit/f125c6085fd775f09a316f61cc89a0ae86826895

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
