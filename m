Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D19C265CD9;
	Sun, 15 Mar 2026 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773564839; cv=none; b=IvjAqk0Myzlo6mxhvtUUIuhm3COGp09udFpabkNZXiAtXqIbd3M0IoI6FMTUzpai91G2RqdnunNuRnelLwj6Y3BBa8C/6MkFRNpb7B/5AwgX7KxSy4zSPl8Ssr0Wn1mbYERR6cneYBdbCWIQebFtXrXREX/Asq8noyn0N4BKBmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773564839; c=relaxed/simple;
	bh=m1VKwca+Qai2oamEOxJQFznJO8zSAU7WZ7lAcZjYyfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqeDYjSM3skRMl9C2UqSTmvski2TE1+kjQYFxAXPA9X8Jvlqw518ZaYAxTCLcMoc2OSWocNe8Ngta7A8sL8j3moPh6HA6Owyy7urMZEaoIVPOYauvNkkNfnX1ewHeMgnBRfLmShPSRXtnDmEP3KUJD1V6rY5oQzJpzbxXNN1ulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0Ej9BY6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0Ej9BY6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602DAC4CEF7;
	Sun, 15 Mar 2026 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773564838;
	bh=m1VKwca+Qai2oamEOxJQFznJO8zSAU7WZ7lAcZjYyfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0Ej9BY6M1dQmilvRz8Owg1JeWPIjTIAlpcdfULClEMxBVvirPLVil2DPYD+2G7Pf
	 IMTiLzGXjw9CatYHPtsi/KRonhONUC0LdSLmZfclpX2crUQE4nr1uDymC98J4WpC/6
	 3mYxem3mFJRC+FuB8eU8TsDaRaqi8zF4TWRmBugwfIv5D4dDgYXNwiSdJozP5pzcIl
	 UYWMzJpafTgzi0hpeWGkvN7DMFlrYJ4rEcB2rkOhTOoyvCPC3UmwPBXOttqF3mAGPF
	 fiLxczL7+qwIbtZ3AseClYiyxWdx4Dh0Zku/sklpHKRlugNkDm5gflOfEfqQVxvQg9
	 EpCRwhjF9x+Ng==
Date: Sun, 15 Mar 2026 09:53:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] reset: spacemit: k3: Decouple composite reset lines
Message-ID: <20260315-crystal-ambrosial-hamster-4b970c@quoll>
References: <20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org>

On Sat, Mar 14, 2026 at 08:27:25AM +0000, Yixun Lan wrote:
> Instead of grouping several different reset lines into one composite
> reset, decouple them to individual ones which make it more aligned
> with underlying hardware. And for DWC USB driver, it will match well
> with the number of the reset property in the DT bindings.
> 
> The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> Also three reset lines each for UCIE and RCPU block.
> 
> As an agreement with maintainer, the reset IDs has been rearranged as
> contiguous number and pushed as a fix for the driver, and reason is that
> there isn't any consumer of reset driver so far, so should not cause
> any ABI breakage. Also, the changes of DT binding header file and reset
> driver are merged together as one single commit to avoid git-bisect
> breakage.
> 
> Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver)

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> Fixes: 216e0a5e98e5 ("dt-bindings: soc: spacemit: Add K3 reset support and IDs")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Previously, the reset of The USB and PCIe was submited as a composite
> reset, try to decouple them in this series.
> 
> The motivation behind is that it will will make the result more aligned
> with the hardware which describe them as different reset lines, and also
> match with the K3 dwc3 DT binding which request different reset, 
> K1 and K3 SoC share same topology of the reset line design.
> 
> See the reset part info in binding doc
> Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> 
> In V2, I've visited through whole reset driver and decouple more resets,
> which include the block - UCIE and RPCU. Also add an explanation of why
> rearrange the reset IDs as contiguous number.
> ---
> Changes in v2:
> - squash the two patches to avoid git-biset breakage

Best regards,
Krzysztof

