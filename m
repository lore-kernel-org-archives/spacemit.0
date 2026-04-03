Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAFB17BB21;
	Fri,  3 Apr 2026 00:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775175407; cv=none; b=kjdN+dmUtfeXJnqFjuCIU1nWHPw1yXYisreH6e6ZCrgpmMT2At0F4JQ06CSI9WaF4wrJClBkqLJXhaD+SPGCQa+ZxVoe7KTphEPlC4nhUj8Tgb5qtOLue2ULfH75yi3r7VjsgRkyM943O56fcDcUs/IDocEIROqvhhIBhHhbzl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775175407; c=relaxed/simple;
	bh=nJRCuS1ixM/gb++UPGhHZf3hIcGTNYq+PUNd5HIN53Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmU7RojtegBtlUKGWgnN3il4Ukgn1A7H8CvvTEgkbr4BnU9RFzRblkbvPwJmVFe0ouZ8i6uuJf2wSRrJWjP0T7I4jSCdDXlEhItaHqOQ8Gk/Np1nKW2wwkHrdtxUpGbZnBBaPMJF4JtNJfaGDuae+L2SeE9xOgdjibejt345oNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDb8U9Nl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDb8U9Nl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452B4C116C6;
	Fri,  3 Apr 2026 00:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775175406;
	bh=nJRCuS1ixM/gb++UPGhHZf3hIcGTNYq+PUNd5HIN53Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDb8U9Nlw/oJEJOToA5jMnNzJLXrkuwEVyYkzJVipDUt1AB6XbhnR551DaQfXeO93
	 MFjozAow6sn8JZ3JSQ4GUMNcBK4QiIdMQBCiRUdQPBl6XGhK2lzgjGcd8XuSIfNaMX
	 WkqjkDH9496cIoEjiItuY8DDgmkP3ftdP2xNfQqvFDRxkhCAYgYY5pNvdnlRr4YAFU
	 /DpVqEFyZE113+oPFj11qOyxBRjj4QdAPznjxpCrb5mRa4gqirCyN9CB+OSeYMuzzX
	 xkv3HZQYtaZODhrCjTVii/WfF0OkG+Q0jefgIhZOy8HKsX25cicZquA2TQbeZD7KWs
	 rt8zS6Z2iTH5g==
Date: Fri, 3 Apr 2026 08:16:44 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: enable USB3 on OrangePi RV2
Message-ID: <20260403001644-GKC1016296@kernel.org>
References: <20260402122045-GKA1016296@kernel.org>
 <20260402130608.133154-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402130608.133154-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 21:06 Thu 02 Apr     , Chukun Pan wrote:
> Hi,
> 
> > Can you work with Han for adding USB support[1]? this will simply
> > distribute our effort, and make the review process even harder
> 
> Sorry, I didn't consider this. 
> Could you drop this patch ([PATCH v2 3/3]...)? 
> The first two patches should not cause conflicts.
> 
> > > +	vbus-supply = <&vcc5v0_usb30>;
> > IMO, the vbus doesn't directly tie to dwc3 host, but to HUB's port
> > so I think this is still wrong, although it may work on the board..
> 
> We can switch to the onboard_usb_dev driver after it's merged.
Sure, I think that's a more elegant solution

> Keeping vbus always-on may cause unnecessary waste.
> I won't insist if you think this is wrong.
Currently either way isn't ideal.. but binding vbus to the host is kind
of acceptable to me, if no ojection, I can take this, then we can adjust
later once the USB HUB vbus support[1] landing in tree
https://lore.kernel.org/all/20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de/ [1]

btw, Could you take a look at Han's patch? if you have final say?
https://lore.kernel.org/spacemit/20260403000539-GKB1016296@kernel.org/ [2]

I'd like to push this series to v7.1, it's almost running out of time..

> 
> Thanks,
> Chukun

-- 
Yixun Lan (dlan)
