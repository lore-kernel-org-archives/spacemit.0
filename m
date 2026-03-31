Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A73287259;
	Tue, 31 Mar 2026 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952709; cv=none; b=VQfk9uBdH+jm2HL+da5oxnQkYvTFAuiG+y50VbuHY4Wm16I6ocLl5IT13fF1+o1Dsy+vxf7wFUKWhqIcU5EQDbLVaL0QJrXcWAGwCKuyJPSMSte2MjDAg99dvJDy7MnpclWLLqlJHheN2i9yxmq5WLfHQ4TuMKCETBE/WuhpG2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952709; c=relaxed/simple;
	bh=xmjyC8ovGkrmNwtrFLdhkEH1h5K0uYv5eS0Flx7Rrts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEC5sQ3gqv05XsIsVRDyvmUG8h3nwicZq4ZLcPDPPy64cVXkZtpc/YjOtSQE7bou1eVNuEC88QwS4s3/yknG8dnlyMAsGRNmgru8vFKeTbmAQhW1CAX8ofwx0bM5bJL0J0xrJrMrPt0SnsjZfKPccRcVT8yS6dNG2qO2CrT2RaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtIiybZB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtIiybZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A17C19423;
	Tue, 31 Mar 2026 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774952709;
	bh=xmjyC8ovGkrmNwtrFLdhkEH1h5K0uYv5eS0Flx7Rrts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtIiybZBckAAPNikznRrqPyk4IcOSE8GTBLK87eKRva9mPmMywxLJ1evTLvVZjwS5
	 gnuJJe3Ns9W4f6ISxthdx+KJVA04HgOfBxtlo7s9JdHbKUfhyFxns9+l4OO9DudwBy
	 E0WLnN+cJtywNIAqI2jEDRLKsJ3lcoInIr+/PkRiD0tmkkpfToq7HH3nlznSPUkp3g
	 bCJUCToLSVSIiiqVMPzWANx42NhUUa/w6jAnDEqUeXhPVUB9f8Thb+9W64pfWo1Q9I
	 Eqlg+i8h/7NdbPfX/m/8rkMiKsYG35x6JcclNX7+sqYGPF5ftbx/8y3U1KAASduL2v
	 M15xncmXSrBOw==
Date: Tue, 31 Mar 2026 12:25:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Guodong Xu <guodong@riscstar.com>, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, 
	Yangyu Chen <cyy@cyyself.name>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add
 deepcomputing,fml13v05
Message-ID: <20260331-faithful-gentle-fulmar-0b9e96@quoll>
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034539.67167-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331034539.67167-1-sandie.cao@deepcomputing.io>

On Tue, Mar 31, 2026 at 11:45:39AM +0800, Sandie Cao wrote:
> From: sandiecao <sandie.cao@deepcomputing.io>
> 
> Document the compatible string for the Deepcomputing fml13v05.
> It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
> Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.
> 
> Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>

Name feels clsoe to login name and even login name has a '.' in the
middle, so a bit tricky to judge. Please clarify your name.

> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Is the review coming from some internal sysstems or downstream forks? If
so, does the review checks the same things as upstream is expected,
including known identity in DCO?


Best regards,
Krzysztof

