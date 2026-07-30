Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E6C3BBA0D;
	Thu, 30 Jul 2026 07:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396368; cv=none; b=SJEURz1Y5JIDSd0EZ2v/NRTRQyXwNFOnesa4RpO/DiSghn8g4GWcgu1vqbgY7HQOECZAL1kYgcLrZwciKQz6Cb6LtjZmbtkFt2aYsrO2acvheVVOJh3goLOUO2WM7u7YQYZwoe7a7lPvoCg5pMWzeZrjucqdT7Cm8m/AjnuJN0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396368; c=relaxed/simple;
	bh=5mt58Mqgcg8dTMXBsjqAq9D9PZ+HM7NV+UQcQyR72e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afUjNZgS3vp6aSIEEKLdlLLHQH+3/dPkfmdnoMt1d+sji1zmNBG+DE5ELgeNk8gH3L3levrhS8OYTs3fm5XZxuoDJ9i5H8D8LuNJ3b57d/p6SpKhZZKiRBtiFNwYuruNOb32hqbWDSmTS+o9tnIs+B4soGIUP2nsuqFENIs9HBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kzgw2Pzt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kzgw2Pzt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CAC1F00A3A;
	Thu, 30 Jul 2026 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785396367;
	bh=W3ATJZYuimYI7I2vIDgoLUhLLq/ceSR+UrM/XTui16Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kzgw2PztcbMlPlRKEScjEKgBTxbyWn8US3ni383zK83sQdwYhAvVyFQEap0uvHN/Y
	 ttjR1QxY7f/Lynp7MFoy3SpU0z89bpz9pcVnKQD3Jv+byUBWNOmofy7LyYhBYnKNrI
	 vM8V3sNKRaDYfE+wOWCQEKBDAvu27wiQLNoZQeVASrVzkyvKBNAARvlzzOpLoW4s3O
	 92XHm3Sx04H88G0GprSrbJa641i4Kqu/8I2Ew6GTgbL1HW+cxhAXnbahWghFeFcCTF
	 VPtAHI9wrb+xmd7E9h4mhDtTPq4l7cLBMSn2TwEt7ddTczGi/0ioaPRG65akVmWol1
	 94TikwPmIXe4g==
Date: Thu, 30 Jul 2026 09:26:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] dt-bindings: riscv: spacemit: add Milk-V Jupiter
 M1 compatible
Message-ID: <20260730-unnatural-spectacular-pelican-1c21db@quoll>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
 <20260729160749.1621415-4-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729160749.1621415-4-aurelien@aurel32.net>

On Wed, Jul 29, 2026 at 06:00:30PM +0200, Aurelien Jarno wrote:
> Add a compatible for the M1 version of the Milk-V Jupiter board, which
> use a CPU with a different packaging with improved cooling performance.
> It enables the CPU to run at up to 1.8 GHz instead of 1.6 GHz.
> 
> Note that the K1 vendor kernel doesn't provide any compatible entry for
> the boards, so use "milkv,jupiter-m1".

Looks like should be compatible with milkv,jupiter as well.

Best regards,
Krzysztof

