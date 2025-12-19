Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED201D27B6
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144376; cv=none; b=Kk8CyZvw4tNQMnAU0H9kzW4PBkRZFgfRwCyEvfs9l0nIIHY5Ewbf/QYGTcW9vdsyFveR+qV1vq/U+PDu5HXru/PvCtfZYMhGbgfzsbzaLLzwGO86zjts+rmkbMsZDagy5uVVFx9Xgnfoh7AeaS14ylxF1hUPSTE6zJM+JvHUsYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144376; c=relaxed/simple;
	bh=5S+syRwNSwqWMhXvvG4pJJcEMFzZkRm5ziltYQh58O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWPBpd9IZgOPd+djWM9P8uTNLgZRSVGiI7reUttDEGX9Bo9ljJoFQjs/RMLey0YLp8QHAdh5xYiFVZMxnZoPBu4ryAarMsqBb72+uQt0f/azq/K/3zQTdEFMSIVzBOIm4xylvyZyhhoJhyVEm6PJ65rdeT54taJdu1zs3bZsJuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 31EB2340E1E;
	Fri, 19 Dec 2025 11:39:31 +0000 (UTC)
Date: Fri, 19 Dec 2025 19:39:25 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add PMIC and regulators
 constraints for Milk-V Jupiter
Message-ID: <20251219113925-GYA1958363@gentoo.org>
References: <20251206134532.1741648-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206134532.1741648-1-javierm@redhat.com>


On 14:44 Sat 06 Dec     , Javier Martinez Canillas wrote:
> Hello,
> 
> This patch series enables the i2c8 adapter, the PMIC, and voltage regulators
> for the Milk-V Jupiter board.
> 
> The power management hardware design on the Milk-V Jupiter is identical to the
> Banana Pi BPI-F3, so the DT Nodes were copied from the k1-bananapi-f3.dts file.
> 
> I have verified the I2C address and regulator constraints against the vendor's
> downstream DTS to ensure accuracy. I have also dumped the regulator_summary
> debugfs entry to check that the regulators and constraints are registered:
> 
> $ cat /sys/kernel/debug/regulator/regulator_summary
>  regulator                      use open bypass  opmode voltage current     min     max
> ---------------------------------------------------------------------------------------
>  regulator-dummy                  1    0      0 unknown     0mV     0mA     0mV     0mV
>  dc_in_12v                        2    1      0 unknown 12000mV     0mA 12000mV 12000mV
>     vcc_4v                        7   10      0 unknown  4000mV     0mA  4000mV  4000mV
>        buck1                      1    0      0 unknown  1050mV     0mA   500mV  3425mV
>        buck2                      1    0      0 unknown   900mV     0mA   500mV  3425mV
>        buck3                      1    0      0 unknown  1800mV     0mA   500mV  1800mV
>        buck4                      1    0      0 unknown  3300mV     0mA   500mV  3300mV
>        buck5                      3    7      0 unknown  2100mV     0mA   500mV  3425mV
>           dldo1                   0    0      0 unknown  1200mV     0mA   500mV  3125mV
>           dldo2                   0    0      0 unknown   500mV     0mA   500mV  3125mV
>           dldo3                   0    0      0 unknown   500mV     0mA   500mV  3125mV
>           dldo4                   1    0      0 unknown  1800mV     0mA   500mV  3125mV
>           dldo5                   0    0      0 unknown   500mV     0mA   500mV  3125mV
>           dldo6                   1    0      0 unknown  1800mV     0mA   500mV  3125mV
>           dldo7                   0    0      0 unknown   500mV     0mA   500mV  3125mV
>        buck6                      1    0      0 unknown  1100mV     0mA   500mV  3425mV
>        aldo1                      0    0      0 unknown  1800mV     0mA   500mV  3125mV
>        aldo2                      0    0      0 unknown   500mV     0mA   500mV  3125mV
>        aldo3                      0    0      0 unknown   500mV     0mA   500mV  3125mV
>        aldo4                      0    0      0 unknown   500mV     0mA   500mV  3125mV
> 
> Best regards,
> Javier
> 
> 
> Javier Martinez Canillas (3):
>   riscv: dts: spacemit: Enable i2c8 adapter for Milk-V Jupiter
>   riscv: dts: spacemit: Define fixed regulators for Milk-V Jupiter
>   riscv: dts: spacemit: Define the P1 PMIC regulators for Milk-V Jupiter
> 
>  .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
> 
The series looks good, I will queue it, thanks

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)
