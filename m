Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37B3AEF4C;
	Tue, 10 Mar 2026 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133442; cv=none; b=T1Rz4aOfvETyRvAmTTN0XYFKC4Z+rytmRKudZR2OJVTFgqaAFo0EOy0Lit+Jwh4ro9MFnnW265Sbc0JPvLXSTy9FDI+C9V8OcsxHvqXjr+T0+kJ08cUm6eVXJlB8iQYueTrX6CzGkQP42FOPO1/j8/30WjNPjQ+kdmivz3///mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133442; c=relaxed/simple;
	bh=WZXCyE3t/S/NiszlvHQc1cUrNJ/Xxt7fDuRcWPppb9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci8nzb1tWydEcMEiASXe1SCfFSpXFStLqoBdPbYoVF2/FFiCXhqEQjbYTQqHzitxC9zkTQxLDbQ18EpHQGpeZe3HWD58cs8t93vXLAgUyn7c3mp21iEB/7HJpOTGDeZ+MN2goro0N13VES+mWaAMn1hhm2yqW1Wj45eijezshXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqN6L5yU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqN6L5yU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E22C19423;
	Tue, 10 Mar 2026 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133442;
	bh=WZXCyE3t/S/NiszlvHQc1cUrNJ/Xxt7fDuRcWPppb9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqN6L5yU2yH7gnbvFALBQeCYBkuoxgARvdPyGbqRRZpk7C8AxZlykoxp2B0xM/ahI
	 g59Q3GcwxxifTE/NdPmge15adkcWMdNkyfbLYSGerLM7mmfwjgFMXkpKNXnEtkayev
	 Bg5vCzNX2sNT90aFDU8uNPI32RYIHpnAaOdqD5jlxxmsPkKSOv+tpDbioXsYVRQE3F
	 UfC1gtLcrAhClTFcHbpgjyHEcIzHdAqDOarPm9TNmQgOmC6fCGeyKt9U5rVe/so2vj
	 xH+LeOahp/JT9SP2ZSsunJrG4z5885gVdoe8HLE4Xq/7LRCz8+JJkFnT0YLFdawrxu
	 Q7RjTZ87uPGNQ==
Date: Tue, 10 Mar 2026 17:03:59 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: gaohan@iscas.ac.cn, alex@ghiti.fr, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, devicetree@vger.kernel.org, dlan@gentoo.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	rabenda.cn@gmail.com, robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 7/7] riscv: dts: spacemit: PCIe and PHY-related updates
 for OrangePi RV2
Message-ID: <20260310090359-GKF302167@kernel.org>
References: <677085181a4215c517907f44b363ef7777fd407b.1769895215.git.gaohan@iscas.ac.cn>
 <20260204140619.47536-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204140619.47536-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 22:06 Wed 04 Feb     , Chukun Pan wrote:
> Hi,
> 
> > +&combo_phy {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie0_3_cfg>;
> > +};
> 
> This pinctrl is clearly incorrect (including BPI-F3).
> Checking the schematic reveals that these pins are for CAM_I2C.
I agree, if the phy is used for USB, the pinctrl info can be dropped
Do you want to submit a patch for this?

> By the way, combo_phy connects to USB3, so it should be enabled
> in the USB3 patch.
> 
I think this is already done, check usb_dwc3 node in k1.dtsi?
https://github.com/torvalds/linux/blob/v7.0-rc3/arch/riscv/boot/dts/spacemit/k1.dtsi#L1180

-- 
Yixun Lan (dlan)
