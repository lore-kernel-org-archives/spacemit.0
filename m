Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1FE35AC1E;
	Thu, 26 Mar 2026 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510081; cv=none; b=FD7WJue05Ofa10pxrmcm59ITYiQTxYQd0v6YBjuBcD2JbW+LMCGrezUPTVF6HqXh13Xo0CvTRInXLrKAYySeJSkvbquIMUvuQ9XMHRYUYDaOdXBN66V2PS1l1ark+z+EYXbtexs6iq9g2N16VutcN3yAgHXH2pKjhoM0Smb+P/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510081; c=relaxed/simple;
	bh=w6bpMofaVIfUfpdCyZUipXkkuDkxq39ED9TKBQJNgu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/u9D7m6uQEB+Fdz+4ng/mgKXKBAN47+wvNY8y+DvVi8nNzscBbmnFybwMa4+5I9zRMvW5V+jOtAYY5ezfiUaS1rqWHuF/d4o2pkpjlJJt9tn0Nbv4N/HkVASBnZMLMFjfeaO1HhTLSd6JycKwKvaCLhIdBSOdEGCfYXCIv3m1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiVgwS51; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiVgwS51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA48C2BCB4;
	Thu, 26 Mar 2026 07:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774510080;
	bh=w6bpMofaVIfUfpdCyZUipXkkuDkxq39ED9TKBQJNgu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jiVgwS511+pR6Ojx6jhNRTBzk+/zVt5jMh1FNAnXe75DJrYvgxT+Nz9H78h/tUwEj
	 5odxiIoYv/QMzJ8IzdL1lN6HL/4fN15uHZAdmeO5Vg4HQTGFlTnoFDRQRIL1hzIJxx
	 6Y5Y4NO5fPv0oBFKkDebPl7FXIf3mBCnut1yT3LFqHKz1KEJWNOWWlzo2sop6PHNY5
	 oPg/mv8oWBSy5WvPC3nfy/c5HqZvGzUeUrxwpSsQbSmiLa+svuLpt0OBF9+Bitau2D
	 Dt1Fw+yPyC5LekiUkORJ6o2oRaH43yw93AzqIT37Fs2wI9XsG2fV7456uj7seD4hlp
	 zGw+RDgiff8TA==
Date: Thu, 26 Mar 2026 15:27:57 +0800
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: riscv: spacemit: k3: add P1 PMIC regulator tree
Message-ID: <20260326072757-GKG777612@kernel.org>
References: <20260325-02-k3-i2c-v1-1-a793776b88bc@kernel.org>
 <6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org>
 <20260325234835-GKA777612@kernel.org>
 <2d0ef51c-c0c1-4670-9221-e0b62ca75fae@kernel.org>
 <20260326071405-GKE777612@kernel.org>
 <4377b748-9604-4470-931a-3b970e213735@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4377b748-9604-4470-931a-3b970e213735@kernel.org>

Hi Krzysztof, 

On 08:15 Thu 26 Mar     , Krzysztof Kozlowski wrote:
> On 26/03/2026 08:14, Yixun Lan wrote:
> > Hi Krzysztof, 
> > 
> > On 08:02 Thu 26 Mar     , Krzysztof Kozlowski wrote:
> >> On 26/03/2026 00:48, Yixun Lan wrote:
> >>>>
> >>>>
> >>>>> +
> >>>>> +	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> >>>>
> >>>> This is even more pointless because there is no user. Dead code.
> >>>>
> >>> reg_aux_vcc3v3 is used by various devices, but I can drop it too,
> >>
> >> Which ones?
> > To be precise, I should say reg_aux_vcc3v3 will be used by various
> > devices in future, but not in current device tree of mainline, e.g, 
> > USB2.0, PCIe, 10G Ethernet, Audio..
> 
> So it is not used by various devices. I just wrote - THERE IS NO USER.
Ok, I got your point, thanks for the review

-- 
Yixun Lan (dlan)
