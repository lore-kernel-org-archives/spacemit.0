Received: from caracal.ash.relay.mailchannels.net (caracal.ash.relay.mailchannels.net [23.83.222.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C75E2FF15F
	for <spacemit@lists.linux.dev>; Wed, 22 Oct 2025 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761167897; cv=pass; b=T+tyS2M8lFwluM6gjpN6w6RwJbOkuvlglNopXXMsjGazDLDQBWqsi9z8USYx48LNhlO5+s2Cm945RRk6QdSQAzAM1dCN5bs2P+xUpu3goecfm8C2pIfJEcMDjIMJ8PLggGamYLdYlKW9lSXY253hNd+dYBbfRzdCZgHhc2GeJXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761167897; c=relaxed/simple;
	bh=2ulWJaEoWvjLywnhaUSzWTPoHkh3JId5s2DEyjFVJI8=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=bTspz6gyw1rQgd5Kbil3efaO462MGReJaOhLK25LHR540gDH7fPGuKR70BMkm/t69k24NhlMpT8ig7mUAHXq4dQ75Pq1Ey3smNo1+V06qXGd4K9YWhdi6FPQp7oTNgrYZhKz8mLimQS9z3t9KLm4SDEX+pR/OKHrZo4y/nFbOpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=ARd1dIo6; arc=pass smtp.client-ip=23.83.222.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="ARd1dIo6"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 22C32103691;
	Wed, 22 Oct 2025 18:54:24 +0000 (UTC)
Received: from fr-int-smtpout29.hostinger.io (trex-green-1.trex.outbound.svc.cluster.local [100.121.87.108])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3BB36103494;
	Wed, 22 Oct 2025 18:54:17 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761159259; a=rsa-sha256;
	cv=none;
	b=GzFl2yaxjy9MxWzicd19ci4u+1NnGnrWZ5bdTBkLc7P1t8GbI8p2zvZGVitccDrJqBFywv
	Mw3Is2+VlbgAteAFLkbr5H9vkZSKgrNpZl1ucfPyXtadjmswlGeNBQPBQXA05w/OSA3LXW
	4veF0E4IJuEBZIobQ+3Y792nGV0ibAo/elt3+OZp/1IAnVx2xaDswkOjxNrXiKEGVHliZl
	VEYOYVxbj86JluPF8EWU3Evt9ftlnZYdKTlvvhUuEdK1QIQVPdyklXoF+QbTsdCk2tF9rQ
	hMuYKCRWhsy9roofZZXwRoQP6CekXjk1cStuf0RTmBLc9ooggfOFFp5RdkscmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761159259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=run8585B0ZdBJhpgD2/vSbhEQ6c1X3Id7wa2MwUm3kE=;
	b=b1+7zaYu3wDmoDQaR7MHCUnlyAjMxt03TAP/OvHlbQU/JjSApRkHuppArRAECjbzdgkusQ
	yRoTkoZhBHBaPs5Pn8z4UfVy+6pk1LMquK/OOfQypHWEb9sEcJ146lcmnnQMgp1U6vpk6g
	Y7+V/ZKQ3RiFBuPywHQWp7SBnYVddz1d8tm5Ce8SaYDurMJhSq1/r1gAIn+Y9BMJpvnO1h
	4e//afvga0p7sWECtgG66H6xDPBKhJORTfdml5utjx/QyuMSF3hwV/Hb7bpgpnmr6DU2TY
	x7IUzMHgfgjsJrA3MaRauhTOKMikW9+78H9iPUKLMJVBrfbQ/Lejza06DJC3xA==
ARC-Authentication-Results: i=1;
	rspamd-5b5956c7c7-6m7zr;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Abortive-Stretch: 28872bb229118efc_1761159263913_3055418994
X-MC-Loop-Signature: 1761159263913:2795527620
X-MC-Ingress-Time: 1761159263913
Received: from fr-int-smtpout29.hostinger.io (fr-int-smtpout29.hostinger.io
 [148.222.54.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.87.108 (trex/7.1.3);
	Wed, 22 Oct 2025 18:54:23 +0000
Received: from [IPV6:2001:861:4450:d360:df8b:aa61:9538:1b7a] (unknown [IPv6:2001:861:4450:d360:df8b:aa61:9538:1b7a])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4csJHB226tz2xwK;
	Wed, 22 Oct 2025 18:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761159255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=run8585B0ZdBJhpgD2/vSbhEQ6c1X3Id7wa2MwUm3kE=;
	b=ARd1dIo662Hv62WYZUQuQersJEZeHBprRD1cAC8gfCOTHyjys/frF6pyzhxVUC4DshZNdt
	ByAAPEtJ8dR0mg0WxlWIFnMb2e1yn38NdVz1xou+LIQVnT0FF3K26t41bX4nMtKJEA756R
	XauhiSpr/cB3Xk7YAvCDhWaHNCD0i+Z0V9fVkvtVsKdYbRJ+XSbqr0JPfaKo4HNmT3vnG9
	aPDwu845z3N9tWgIvkvAhxocQZs4gWHmcxfM2dErDrpWzqcWU3WkGe79Q0kablI3N4QqgU
	W0K8aAciPuCv8M0jKzqzawBhgy+n/EuVFzzErBI7TgFWJuDu1JNaK1huopPwAw==
Message-ID: <da4748ed-01f9-48a6-9939-320e83aa9eb0@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
To: Vivian Wang <wangruikang@iscas.ac.cn>
References: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
 <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>
 <002e0b15-57b6-4433-a9fe-8b7ce4b8dcd9@iscas.ac.cn>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <002e0b15-57b6-4433-a9fe-8b7ce4b8dcd9@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 22 Oct 2025 18:54:13 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=fpGOZ04f c=1 sm=1 tr=0 ts=68f92857 a=XzW6OEp4kASjoDH3AA+DzQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=lNCKr4LvwL6Du062nSQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Hc5yV98H2ep6aNAGOANv:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfLWRuLxrpFpBnj8c4GNDeyMskPRz/xu/oVbY1JLfaK1xSywhsC8umc/oLYGQMH0J+8A/28MVYcgsBx3vvfK64zxyuWWPQMZvWFQg1jBIeGmUuRWhIwS+ EC6qYBi4HlrcQZOzqxL0odTvXwHDxkRy2BPl6GIOiTcrpuvurek6t93KjadTmvwELinbNBCOAShyHN2q7q8EdB1DdeetuUbNu/F9A+wOn8W+Yr2e/z5pKhGx KkPioBBD5zas8PjSXAs+14V0UZqMmUJN52dAUWxHVj0AT3o4ZzEs3n5GF6QZO7jzP313qoDRw809dzAacZr9ZC0loJa5a9guirpAr4PSMWX1pvXLGTuZ5DdO +93ZnVrXnQUxNLALBoi/4ga/nUhq3MOnTL+uoULvYIqd5pbhDyrSibZWlDTMwhohmWgWxZLxtEJR8ROy96afT5r0st1K8fMGlpzT6RgCXtpUm1yKXzF/71sA 2f0rvvWZRRIns3SUdZIeEGredTS2j7J9yQ4pPJzfI0+G8zrtGV6WpjWax5UN+UsUc5XH6wDtMjhhpQ8fajLsI0NdIV/4CBTIAYQAE3iJ34r9J7IJGIvnvgVI aKFqAtNpS9Z2+XkxnOrg14PMQ/p9+BRRkr2bQ/tGOgvX6pIGUOaFw7GxHJ7QgtoRu4PlwV4FGvqAaX+odw5GhT5dVRbHYAy8hY3QV+fewRuPOvmv7BYR96xG /vmYjyY5wdy1/Ce7fuwBO+zO5+uFEVwlCHcZUvFjcmEs6RYCNs2fxw==
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Vivian

Thanks for the guidance and help!

On 10/20/25 11:07, Vivian Wang wrote:
> Hi Michael,
>
> Thank you. I had meant to do this after v6.18-rc1 (which is now), but I
> didn't have this hardware to test.
Happy to help testing, if you have code to share :)
>
> On 10/17/25 18:02, michael.opdenacker@rootcommit.com wrote:
>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>
>> Aligning with k1-bananapi-f3.dts
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>> ---
>>   .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
>> index 337240ebb7b7..2a75ca93b499 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
>> @@ -33,6 +33,56 @@ led1 {
>>   	};
>>   };
>>   
>> +&eth0 {
> Please add eth0 and eth1 to /aliases so that U-Boot, udev, ... can
> recognize them. This is used by U-Boot to set the mac-address to the
> same value used in booting, and by (systemd) udev to set the interface name.
Done. I'll submit a V2 soon.
>
>> +	phy-handle = <&rgmii0>;
>> +	phy-mode = "rgmii-id";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&gmac0_cfg>;
>> +	rx-internal-delay-ps = <0>;
>> +	tx-internal-delay-ps = <0>;
> The hardware design of OPI-RV2 is not the same as BPI-F3, so the
> parameters here deserves some scruitiny. Same for eth1 below.
>
> I would appreciate at least iperf TCP tests in both directions on both
> ethernet ports. The expected speed should be at least 940 Mbit/sec - if
> it's much lower than that something is wrong.


Fortunately, the results are good. They are even better than the ones 
from the vendor kernel in OrangePi OS 😂.
I'll share the results in my V2 cover letter.
Thanks again
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/

