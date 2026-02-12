Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F723446AD
	for <spacemit@lists.linux.dev>; Thu, 12 Feb 2026 11:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770895466; cv=pass; b=bI0Ve+9NAELhDmgRJ+cJioQADs8esrtYOpf6+/nFc81qnMNIiBfjy8c9NoH1Mu2XJk1jPTl0TWFxS3I5/IAhA5JddnCkB3vgCnynKXQMGrJCl8TaXGBS7eFQJ+7eV6xBp0eWbdxleCGx8oBZoyNuqOOBlrRDxGDHLVLnFiBCOlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770895466; c=relaxed/simple;
	bh=aF3qO+3sk8KCbgBGOu+WadDm4gK00VEQqM6dxzce1CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/7eT66+PtuRpa1KSbphpHO06QdO63FJdtIIRGxZyjpbAUmUbMwdSr+EeIMsT5k3TMDYHyRuYlfkDiLzlIflPl19bYaqbOsgGuwPrmORXMMlbkmpisxc+enlvbdgYvofnjdMiLRh8hg1Pt1C2fFKIib+Hma9L1uNmOutWdXaCVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=Dnzo+cx4; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="Dnzo+cx4"
ARC-Seal: i=1; a=rsa-sha256; t=1770895450; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ciM/MCKewRmR3bpICPa2OinU9RB2ElstD1FLBBLLLfT3Zn1YWeN3dnJ2WJNgbLjboHgBrO8Snftjgj5nas9lAhH8hs2Mw8gWqxsGvW6mrhTcQNpXNlLXGmOHMv/4/cg4Jzv9arFaHRKJPsWxdD2ZvLpEUWlD3OUMmNS8aky+9+M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770895450; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aF3qO+3sk8KCbgBGOu+WadDm4gK00VEQqM6dxzce1CQ=; 
	b=Bpznyr1Ce/65abpW4ea9rNZ+n5wf8SPKFQcKbaItC44rTuLXkticjBfXdSnqDhW0arIS4vi0+PdsvxCclLD7hmj7w4J+PfOA8Mt6gGCZ0BPLUdXfY6hAjOVdbYE0vZory1abzWOid2FeZqwzmcvpq2cZuRM7JCgnAOn7LNVIU6M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770895450;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=aF3qO+3sk8KCbgBGOu+WadDm4gK00VEQqM6dxzce1CQ=;
	b=Dnzo+cx4JVdOzyJ/jbd+Q2XJX4i+Ojct3KAPLJSuX3Yd9ZSmj4quJVrY0hXpBSA/
	jDA6LbuAA2RbV0JfoNxI1JIb4zTBxzHGztYDAeIHKvyUzA6x8V85qY3g8PRhSa89Tpu
	/P1Lyf3ZlzKzK7b/iL++/uhyBSCxdEgErpo6z4Ak=
Received: by mx.zohomail.com with SMTPS id 1770895448118306.0552867056007;
	Thu, 12 Feb 2026 03:24:08 -0800 (PST)
Date: Thu, 12 Feb 2026 11:24:00 +0000
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] phy: k1-usb: add disconnect function support
Message-ID: <aY24UOvYsnh_7ZCO@pie>
References: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
 <20260212-11-k3-usb2-phy-v1-2-43578592405d@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-11-k3-usb2-phy-v1-2-43578592405d@kernel.org>
X-ZohoMailClient: External

On Thu, Feb 12, 2026 at 09:38:55AM +0800, Yixun Lan wrote:
> A disconnect status BIT of USB2 PHY need to be cleared, otherwise
> it will fail to work properly during next connection when devices
> connect to roothub directly.

This sounds like a bug. Does it affect K1 SoC as well? If so, I think
it deserves a Fixes tag and backporting.

> Signed-off-by: Yixun Lan <dlan@kernel.org>

Best regards,
Yao Zi
