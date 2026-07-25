Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DF72EEE6C;
	Sat, 25 Jul 2026 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784986091; cv=none; b=Lop76BKD6wMvGHqtXZn7oqSqxm4kUDoTLWm/AOYd08N+rM9wvUc4HwzjTYrXRote4gs6shrD80bPoFHNaMz8gr14KTZsGVNpnPDAXZMrm+XCRDaSeYbJK6sRrpYZsYx1QGWHc/XpkDKv1Ge4DJ6vYzxXvofRrS6aXyq7m0Mdisk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784986091; c=relaxed/simple;
	bh=osnBtyWqH1U9KQGI/44wOEjhZ/fjNSGFfB8OxWMNZWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9WDoZc+NGLod5ZrpID0LGeGrqSuAm5sviPMJSNunnr5JYNsTclbM6beNqS6xiqrxkFK8q0gtG3l6ZaRSWvuFXYbNfh6zl2Vn9I8AC94gkgBV2E4t6y4wIN+lj97EtTQs0UAmAkrthlcZOXG+NA3AlB97WY2Zi2GZLpOLkAQltA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G25tGZQw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G25tGZQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAC81F000E9;
	Sat, 25 Jul 2026 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784986090;
	bh=h0WVTrNqm2vTc3/56dVsB7JggUAIXw2Y+0evxBAD9XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G25tGZQwqVd7GR58SDdll5vPMe1mOc0QskFm3OxBAi8xWD8lJWgKWeIHgth+cShU5
	 dxTToTDkeE5eK/ySOsHJxKlctJzyx4gIu4fdfKUaGB83LAzLbnsPshw5/sWQEEL8yE
	 +FkGVSdoh5kdi9eWaT/KxI8yTp7llg2K1nYKfIaayUbUJS9uKGZ5BohcwKPNUiVn+u
	 Lc1Moj4roRR11j9DfLFdg3S081jt6KE2TLosdsA4fI9L+cEqV/7EQK8Bk0LQBgPlHZ
	 85Wk/zBkHJqKocNbK3psiScKS603E7/mtg9cVa0kzJd7OKCGZJzYSG5Tuv4y3hNmC5
	 GfLYXvKbnj2Fg==
Date: Sat, 25 Jul 2026 13:28:05 +0000
From: Yixun Lan <dlan@kernel.org>
To: Jennifer Berringer <jberring@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: add eeprom for K3 CoM260
Message-ID: <20260725132805-GKG77545@kernel.org>
References: <20260722202848.1817988-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722202848.1817988-1-jberring@redhat.com>

Hi Jennifer,

On 16:28 Wed 22 Jul     , Jennifer Berringer wrote:
> SpacemiT K3 CoM260 Dev Kit has two eeproms: one on the compute
> module and one on the carrier board. Both use a Giantec
> GT24C02B-2TFLI-TR.
> 

Patch looks good, so

Reviewed-by: Yixun Lan <dlan@kernel.org>

> Jennifer Berringer (2):
>   riscv: dts: spacemit: k3-com260: add eeprom on i2c2
>   riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1
> 
>  .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 15 +++++++++
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi   | 32 +++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  | 12 +++++++
>  3 files changed, 59 insertions(+)
> 
> 
> base-commit: 199380e4d8cd22e539a08d4949e9582b09390bd5
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)
