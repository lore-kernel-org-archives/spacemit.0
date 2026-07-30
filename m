Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0919F23909F;
	Thu, 30 Jul 2026 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406004; cv=none; b=DXX+LpJlrsAC1/7mEmklbXnixEZhQQVQIbtIPnbPAF5+6Sv+1FZB/UVAqrF3jWw5k4+I/0+UEGomYSnXt9KrodG9WADohzhuGHhDcrPxfnKJSuncVJcRwf3nQZ6gsa4vO7VT2pkEIODQXHWBjqHHmZb029ofiTCRJW4XNv40l9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406004; c=relaxed/simple;
	bh=WZ/dfcecrshIlD15fO2HcleI/OFR9mxw1MkDyPYZowQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvU47ZKYuHu8+sDxjF01CjvO/6yw+/fMbBGcRJaSZgDfVcZkA7HlJilntlQIRgLdW9AJ8hfwhVAPE5g/fZZTWGk4MFpHxOx6mQMRDWojh9Mpfyjt3+cHRSA7n9IumakR81rl+Kchr2i1uhGGy/h6G88JbeVL2PQFXM/yTwqlWOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=zA/UEhuy; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="zA/UEhuy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=KcmLOWVvN/7d541vlBTEHuDWksSNPbRNgmm7FsDP6Ps=; b=zA/UEhuyC49HukyX/QWi6RfN0S
	TiEntt5ce/y3OkGxjcq/Q80zmQ7qx4vUEkkrJLcnj+W/vfRZP0vlELl45svTiZTIMqucP0pE0EZnO
	jdW75WxM7lB73avjKRRT99ToeTmhKVCntPGW85y0/hmqh+ArVW8Ot2aHaqDuXaPD9hrTqXirXAoo9
	OpMiDeEbeWQSjieScvhEqBpgzF13ucW/5gxbQw5jrN/L211voBKa77fe/IET5qghBTXPmc6cQtDpR
	4tIeoF6l+liA1vD5OjLRZ7oQLSMSZvyvTPJ31LHXbInqmUq8z+ANLYkvRDOR502163NPEjEIALxkR
	a7KHi0nQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wpNep-00000003zU5-0sJ4;
	Thu, 30 Jul 2026 12:06:31 +0200
Date: Thu, 30 Jul 2026 12:06:25 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] dt-bindings: riscv: spacemit: add Milk-V Jupiter
 M1 compatible
Message-ID: <amsiIVakPFWGwcTM@aurel32.net>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
 <20260729160749.1621415-4-aurelien@aurel32.net>
 <20260730-unnatural-spectacular-pelican-1c21db@quoll>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-unnatural-spectacular-pelican-1c21db@quoll>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2026-07-30 09:26, Krzysztof Kozlowski wrote:
> On Wed, Jul 29, 2026 at 06:00:30PM +0200, Aurelien Jarno wrote:
> > Add a compatible for the M1 version of the Milk-V Jupiter board, which
> > use a CPU with a different packaging with improved cooling performance.
> > It enables the CPU to run at up to 1.8 GHz instead of 1.6 GHz.
> > 
> > Note that the K1 vendor kernel doesn't provide any compatible entry for
> > the boards, so use "milkv,jupiter-m1".
> 
> Looks like should be compatible with milkv,jupiter as well.

You are correct, I'll fix that in v3.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
