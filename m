Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3459D35AC09;
	Fri,  6 Mar 2026 22:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772836801; cv=none; b=t/TrcKFj+j0QfNm6X+3agG4yW+HEHpSHV23MnrxxgSAtzdAthp5XjaDvOnH3O8sZPW6YUUmy5M7qa/QGZVI4OBrwID7mwRphL1Rea6TRsa3O14Lzu/1PuQ5IBCQgwHrMDonYK5DW8akNNKgNqKYyute7KZLD9ouv6+XsfLSsoNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772836801; c=relaxed/simple;
	bh=2pliSVYtv80Y4TlYoK1pP6t8MG+RWP+9x0mqyGizOec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6FMMW1WsOj6lWzuF7EMrt78rlQUzQ/dqII9ua4WVBSbk6vgltQFVEDxkAgnkLbLVwJnOVu5X8uLuhk5aeMWw9UECVtU0ExyLXG9ewf3RZ60O3gPpbw8YI8K/s4pm5t7JqOSZ2gBHEXaLSJpD1tB4nITIx6XUZQfklDQzJR2Jbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MniWxJ9+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MniWxJ9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F48BC4CEF7;
	Fri,  6 Mar 2026 22:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772836800;
	bh=2pliSVYtv80Y4TlYoK1pP6t8MG+RWP+9x0mqyGizOec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MniWxJ9+U76Igg4sPGN5XFVHpZGsZlN0u1T6ycOxXlOOFIB8GG7lOXq+ZhpOpBdMA
	 NJDZTCVBhDoRVmoBoQ3dEMPijuVwxdonrNbZM4v6ptD6Ec0SiNXFuFMfArjpljmzgq
	 cI1s2Y60hwx9PSKIfW0gfsgNyEIqUhHHNMjUsfuq3gUqk1OKu7JKLXFm0H7mpSQj/i
	 UGPCSfavNXYV/gQmgLIgEk2WM699lQ6ajXou+Eppq1avysz+EFE9CXvDGeIQ5mlIIS
	 nGIrO6MFd0JXQI2q2/bP78/heNK+pM/LCdEnMqyzl8zEyjAL70Vq5VxQUQ6hfwYhYX
	 UyyqUitTiixoQ==
Date: Sat, 7 Mar 2026 06:39:58 +0800
From: Yixun Lan <dlan@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Alex Elder <elder@riscstar.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/3] dt-bindings: mfd: spacemit,p1: Add
 individual regulator supply properties
Message-ID: <20260306223958-GKB302167@kernel.org>
References: <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
 <177280476778.1042627.3296790673262334325.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177280476778.1042627.3296790673262334325.b4-ty@kernel.org>

Hi Jones,

On 13:46 Fri 06 Mar     , Lee Jones wrote:
> On Fri, 06 Feb 2026 10:32:02 +0800, Guodong Xu wrote:
> > Add supply properties that match the P1 PMIC's actual hardware topology
> > where each buck converter has its own VIN pin and LDO groups share
> > common input pins. Supply names are defined according to the pinout
> > names in the P1 datasheet.
> > 
> > The existing "vin-supply" is dropped from the binding document as the
> > updated spacemit P1 driver no longer parses it. Only the per-rail names
> > ("vin1-supply", "vin2-supply", ...) are supported.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
>       commit: e13ebb4cfcff4399a34c3a89c493020899a431f7
> 
Not fure if this will cause a conflict, the patch has already been merged
by Mark, see

https://lore.kernel.org/r/177204643911.168523.3724548692200647978.b4-ty@kernel.org/

> --
> Lee Jones [李琼斯]
> 

-- 
Yixun Lan (dlan)
