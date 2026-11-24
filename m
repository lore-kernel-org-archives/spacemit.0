Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562352;
	b=F1O8HuguR+3OhWOBOc6UQOJSWiYI+r3EZ593k1IBlRa0p/R3MkWLROkWBgfb/5aT1HFV
	 Dbnysl58UDlSS6IUV2452Ux3fMuiHiDhuimaIZuquUi8pqGo2Pwo0K5iI3HXsCSlBdggf
	 /Q5ym/F0k8CuqXm33awO8jJ85F4K/1LijF2Fx0OMvNF+51vegJ5/BhsT55eCwq7XZDcC6
	 09jTtcoqnncLm503VPdNPC9bsfWcbv3dThXuVVQ06pvcx0/GHCv5A4k8N8sAFuj4NEedD
	 ud/YKrrFnONV952IhIsnxaUt1fRz74eHjO0QKicgmgjNO0jNrCab7Tlj3QeuhaolmZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562352;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SRWWMd+yzuA6S+ZzDttweE7vNGF2Hx8rwgs6Wuiy3ZY=;
	b=btjyAFj4l2rRTiB+SCTg8RwQSIQvN2FfiCARGod/u1c5IIyXBkN3Kd1ZBOtve2n2n79y
	 EanaVMFX6ZfPa/tYB1rnqilEN1459qImjowigW4pKpuF+LMweKjr2wDLxbxtBeTwchqOb
	 m5zii+LAweayy2YmfTnvDnRGIV8JLuwhlK2HMgvZ2n8tYgjGRuuLKlEob4Xikd998hoAO
	 E7flcyntKSrfR9ejtZx54QBik0FeXoiEHSGeHwjNDl0SFbLlVdAzZa9odEjqun9FJLifP
	 t6Eh+7z3Oeol3rGrOTK9zovul00sytUdtTIzraRMssC4q7n7SItXLTYf/bzFnYiZKBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ooPODiqh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5667A606A31E;
	Tue, 24 Nov 2026 23:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ooPODiqh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB321F000C4;
	Tue, 24 Nov 2026 23:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795562352;
	bh=SRWWMd+yzuA6S+ZzDttweE7vNGF2Hx8rwgs6Wuiy3ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ooPODiqhP96bXIhoVPrnYtH5/9wmyGxrQBG4wgzt0BL2f25b/6lKOtsnmT4tvBT7T
	 nAqDnBBxjWb7MBDfHHZ6/JefncBErm2Pcb7T4H7TuWKJaEQmFzUvAVP7A3lwWnNxn/
	 54jk4xVvT8IXm6koQbJSzYwy96d0n700WNpGDXPRyS4Vvm5pmMd286xk46DZssGcAW
	 iksh7sRP7JAB7MR0Vd8v4dLxST9TGZB82+vWDPo2zkbMbCH6luHwOXv6XuFMJnrYvN
	 hPxNTzqQyymFeufwt3VJjMVYbf3YTZwBWL8y80nXjR4kbs+oKhuDeGaodVT0d3AEUI
	 cHyEE4kI7IY7Q==
Date: Tue, 24 Nov 2026 23:19:09 +0000
From: Yixun Lan <dlan@kernel.org>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes
 bootph-pre-ram
Message-ID: <20261124231909-GKB245721@kernel.org>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261024092558.143621-1-alan.tseng.cs@gmail.com>

Hi Hung-Chun, 

On 17:25 Sat 24 Oct     , Hung-Chun Tseng wrote:
> On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
> that stage sets up DRAM. This series marks the nodes it needs for that
> bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
> in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
> the PMIC rails and the SPI NOR in the board files.
> 
> The vendor confirmed that the BootROM itself does not access the
> EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
> sets up SDRAM, and DRAM cannot be trained without it.
> 
> Testing: all K1 DTBs build, and dtbs_check is clean for them with and
> without this series.
> 
> I used Claude to help read the U-Boot SPL and the device trees. I
> checked the changes and ran dtbs_check myself.
> 
> Changes in v3:
> - Reword both commit messages to describe the hardware instead of what
>   an SPL does, and drop the U-Boot paragraph from patch 1 (E)
> - Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
> - Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
> - Drop the Assisted-by tags, see commit 1e035297ffda
> - Keep E's Reviewed-by on both patches, as the changes are the ones
>   discussed on v2
> - Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/
> 
> Changes in v2:
> - Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
> - Rebase onto the spacemit dt-for-next branch
> - Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/
> 
> [1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/
> 
> Hung-Chun Tseng (2):
>   riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
>   riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
> 
I'd not put this series on hold, we generally could address other
remains of issue/improvement later. so with

Reviewed-by: Yixun Lan <dlan@kernel.org>

>  arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
>  7 files changed, 47 insertions(+)
> 
> 
> base-commit: d05c6236496071916e19012cda7149465f15e66e
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
