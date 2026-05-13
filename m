Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC2C2D73B8
	for <spacemit@lists.linux.dev>; Wed, 13 May 2026 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658408; cv=none; b=S8rl1BIxBhtHVo6FmJwh2AsjQWhnliWuC0ef1SfB8VbwRA1dW3P+3jsetai19IDSx0LIwOs2ubBYGTHRfq1aGmebWqMxhasciI4XZSR8DHCFZAWICC/rFzE5JwkkBzI9eZjToqjoH7bMHPZNdz1h2TTV2x7VHZK1sDB/KsVRVl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658408; c=relaxed/simple;
	bh=okQCgt6yxURc/y97vTYFaSc8Vj718GsG1uHahX3Yywg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k163XO8F8KFpOPhyBPdWcHb30b7cDDcTngfP+3V+dv8MBj5KDNj2T+xlqbdj/k4HwARoexP7bO+P2BxXf1RZxk4MP72gMIN8Wdy0QET3sLPQ/nlD9NW8NUYeblpGqawA1TGJW1LoaQ+j4P7QsaipfyA2QHgAXXojl/SR6QHl7C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJ0lNdoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJ0lNdoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5F1C2BCB7;
	Wed, 13 May 2026 07:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778658408;
	bh=okQCgt6yxURc/y97vTYFaSc8Vj718GsG1uHahX3Yywg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJ0lNdoc+0TRBSMlrJ/StV1MeP1FeShPal37k87Wj/7mZ8+0d/ZEfC/C8KhUr7FBH
	 1948BZbOsoq4bycnwljWIlE+PoP5X9Wmb+UlAMbvDhAerPkB86xzpIKSGQZnUFxOgF
	 9G+T982Fn50PRmF3/ZSFWw+TIvKXM6dRjtkitDv364y+tWb3/we+chaFaMe9RKzEN9
	 KhNM8M+AbqLCT7uILxpnNzoxA85PifrVx1ZC5Tqvo9KmHIowE7N/FH3TIbwhoYB9+N
	 Ya4PhbbgedFAYrYEZCOq61p1jlP/G1Fwk4BUNQrfEF0ZnkEGM5M7i8eQFNHxuaLq/A
	 F9UmtjJOKEANw==
Date: Wed, 13 May 2026 07:46:44 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 0/6] spacemit: k1-musepi-pro: add missing devices
Message-ID: <20260513074644-GKA3624092@kernel.org>
References: <20260513071958.29574-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>

Andre,
 
 Thanks for pushing this new version, overall, this series looks good to me,
Although there are few quite trivial issues, which I could help to fix it while
applying, let's give community some time to test and review..

 P.S I haven't run it on musepi board, but trust you tested all functions..

On 09:19 Wed 13 May     , Andre Heider wrote:
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
> v2:
> - drop reg_vcc_5v0_sys as per "non-controllable" review comments on
>   similar patches for other boards (kept the root reg_usb_vbus for though)
> - add reg_vcc_4v0 instead as p1 vin?-supply, misread the schematics
> - drop mpcie_vcc_3v3 and use pcie_vcc_3v3 for pcie2* too
>   ("non-controllable" again)
> - all of the above makes it consistent with other k1 boards
> 
> v1: https://lore.kernel.org/spacemit/20260505160623.1369347-1-a.heider@gmail.com/T/#t
> 
> $ cat /sys/kernel/debug/regulator/regulator_summary
>  regulator                      use open bypass  opmode voltage current     min     max
> ---------------------------------------------------------------------------------------
>  regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
>  PCIE_VCC3V3                      5    4      0 unknown  3300mV     0mA  3300mV  3300mV
>     ca400000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
>     ca800000.pcie:pcie@0-vpcie3v3   1                                 0mA     0mV     0mV
>     ca800000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
>     ca400000.pcie-vpcie3v3        1                                 0mA     0mV     0mV
>  VCC4V0                           8   10      0 unknown  4000mV     0mA  4000mV  4000mV
>     buck1                         1    0      0 unknown  1050mV     0mA   500mV  3450mV
>     buck2                         1    0      0 unknown   900mV     0mA   500mV  3450mV
>     buck3                         1    1      0 unknown  1800mV     0mA   500mV  1800mV
>        2-0050-vcc                 0                                 0mA     0mV     0mV
>     buck4                         2    2      0 unknown  3300mV     0mA   500mV  3300mV
>        d4280000.mmc-vmmc          0                                 0mA  3300mV  3300mV
>        QSPI_VCC1833               2    1      0 unknown  1833mV     0mA  1833mV  1833mV
>           spi0.0-vcc              1                                 0mA     0mV     0mV
>     buck5                         3    7      0 unknown  2100mV     0mA   500mV  3450mV
>        dldo1                      0    0      0 unknown  1200mV     0mA   500mV  3400mV
>        dldo2                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>        dldo3                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>        dldo4                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
>        dldo5                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>        dldo6                      1    0      0 unknown  1800mV     0mA   500mV  3400mV
>        dldo7                      0    0      0 unknown   500mV     0mA   500mV  3400mV
>     buck6                         1    0      0 unknown  1100mV     0mA   500mV  3450mV
>     aldo1                         1    1      0 unknown  3300mV     0mA   500mV  3400mV
>        d4280000.mmc-vqmmc         1                                 0mA     0mV     0mV
>     aldo2                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>     aldo3                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>     aldo4                         0    0      0 unknown   500mV     0mA   500mV  3400mV
>  5V_VBUS                          2    1      0 unknown  5000mV     0mA  5000mV  5000mV
>     c0a00000.usb-vbus             1                                 0mA     0mV     0mV
>  VCC5V0_HUB                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
>     c0a00000.usb:hub@1-vdd        1                                 0mA     0mV     0mV
> 
> [0] https://github.com/spacemit-com/docs-product/blob/main/en/k1_muse_pi_pro/pi_pro_hw.md
> 
> Andre Heider (6):
>   riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
>   riscv: dts: spacemit: k1-musepi-pro: add 24c02 eeprom
>   riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
>   riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
>   riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
>   riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
> 
>  .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 309 +++++++++++++++++-
>  1 file changed, 308 insertions(+), 1 deletion(-)
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)
