Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3618CEACD;
	Thu, 30 Apr 2026 02:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514676; cv=none; b=JLYADq54P4vkY1yNy8Sow0JLOuiPKUljoW54tOV6ix8qfrn26LhUN4itxgkIoJPsut6iIppSjZfIu9FpqDkgUkJp4lgfoAqb1IA0NweY7tbfns+RsLpROliH3bJ/NzTQIvxbMwFxrZLoi61tcZJevFZ4StkHLauIj/y8LDEDrF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514676; c=relaxed/simple;
	bh=a++YbQU7FRs0I4k/4YaT3TJqWIFkLlG6YRMDY9dCTQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8rqCOKjH6/5WF2oq0viCnqnZd/QgDi1o1jx/BtK9C0f/fKi9BmTWH6OttPGi7z7NDgIs2N8dbC8UBvwREtVcJYxXWJ+G/ib2RXLKNSPCIqiyK6hB75Wzy96B6ntcWmbTOyxqzpII1MJbVqy8ngvq6SXNTnk+oQfI+vI7sA0TPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STgN3oCr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STgN3oCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746D8C19425;
	Thu, 30 Apr 2026 02:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777514675;
	bh=a++YbQU7FRs0I4k/4YaT3TJqWIFkLlG6YRMDY9dCTQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STgN3oCruI6nLZgGJYguv7aaC8yIHWjXDkwuOm5EOsbfjAbK/Y7wX2fo5zVHG6dEz
	 4TrPuODwCZF9r88CI2GpMxTap5isMvLp5ztV95vFPT5u3kpvbnGgpmr2VVlFRi4NFk
	 gk3rfdTBQiB+qPUNHV2/aCUI9SHYukSfMSvvIXEuRm+34HxC6kJMAdQZeA7JIMpgys
	 yUVEyxrPyBD9jsHShIgkP+V+tTJuiBZRIItoHPPN87ozw+P1ZrO+pU0NqUV5KQ2HKL
	 yl6beHOEksT/+ttHAPwSg4GzO6iSVPjrlGiuOpH2D+E7TL7V7dlFdgvCSQIQEfW21j
	 tqwg4emlOmEmw==
Date: Thu, 30 Apr 2026 02:04:33 +0000
From: Yixun Lan <dlan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v4 0/2] phy: spacemit: Add USB2 PHY support for K3 SoC
Message-ID: <20260430020433-GKA3230719@kernel.org>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
 <20260326001443-GKB777612@kernel.org>
 <20260401130713-GKD976850@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401130713-GKD976850@kernel.org>

Hi Vinod Koul,

On 21:07 Wed 01 Apr     , Yixun Lan wrote:
> Hi Vinod Koul,
> 
> On 08:14 Thu 26 Mar     , Yixun Lan wrote:
> > Hi Vinod Koul,
> > 
> > On 01:00 Thu 05 Mar     , Yixun Lan wrote:
> > > The series trys to add USB2 PHY support for SpacemiT K3 SoC, while 
> > > patch [1/2] implement a disconnect function which is needed during
> > > next connection.
> > > 
> > > No DTS part has been inclueded in this series, instead I plan to
> > > submit them later while adding USB host support.
> > > 
> > > I've collected all patches and pushed a complete review branch here[1],
> > > for people who interested to test easily, which include DTS and necessary
> > > changes, other patches may still need to improve, but sufficient for
> > > verifying the functionality.
> > > 
> > > Link: https://github.com/spacemit-com/linux/tree/WIP/k3/usb2 [1]
> > > 
> > 
> > Just want to ping this, Can you queue it for v7.1? Thanks
> > 
> Ping again, I'd like to see USB2.0 support in v7.1 for SpacemiT K3
> SoC.. and I think this phy patch is the only dependency that waiting
> for, the USB DWC[1], and hub[2] patch already merged
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=c05cf9d274daf72dc7e433480cf2e0e888f6bd89 [1] 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=00b4fe5be06aecd6426930de86b7cffc2330f4b8 [2]
> 
I'd like to ping inclusion for v7.2 cycle, checked locally, it's still able
to apply to v7.1-rc1 cleanly, so I see no need to send new version.

Many thanks

-- 
Yixun Lan (dlan)
