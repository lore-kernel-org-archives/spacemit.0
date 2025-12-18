Received: from slategray.cherry.relay.mailchannels.net (slategray.cherry.relay.mailchannels.net [23.83.223.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296B7309EFA
	for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 05:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766035515; cv=pass; b=cNxgBfIMG+XSowR5HZssDKKCYFURqQ8Ns73SWHmC14EWRD+0ClPpkOPA4zJHhdRjUQN4uE+k6f9n29YXfyMqMukwwK06vGoeL54k+KX/YWd/gSgJjfNBeTAQymEvuKyPLJWQBkhQIlH93ZL8WfJ7L6Asbp5l/JwCtaCFyAgA2tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766035515; c=relaxed/simple;
	bh=rXU8umz6m1Of5j490qZrvo/HN37DY4dWMT8REY7evl8=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=Oa21GIi2XpURqGmBO+5DqefwwiMaRbq/lfCq/0U8RW8V8m//9wVqSkP4AGkX9WHfyc2ddO7HYj4H7WX5OCL/zgCHHos1rRNopOmQZbIGNNjr/KEwUmT/12/w7PtVci52QXlNDsmtNdOi0HTXH0QdcaLsDWSRkWKjmINE68jxrHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=f0A7TBvT; arc=pass smtp.client-ip=23.83.223.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="f0A7TBvT"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1B91F821484;
	Thu, 18 Dec 2025 05:25:06 +0000 (UTC)
Received: from de-fra-smtpout6.hostinger.io (trex-green-7.trex.outbound.svc.cluster.local [100.108.213.181])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 254E38211E9;
	Thu, 18 Dec 2025 05:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1766035505;
	b=ZOZndSjG6GhLZ0Y9DXJltlMLQOpapQimB0xoh9a6eOjN7V/sgw7ZJOA6qq9MVPieEx+lG0
	TxGeTvr4ArmAuPoOPGx08uWaLS6AoyDyOftL18rWa6rxEIQOEb8gKoduRA89Wwv8KcC3g9
	hzWfjgUtKLUJSCeUjpm5TNPEsbbBXE1R7kvaRy7EwF3EvZ7zFoZ0PK3rMEJKLuL/xN6QvQ
	9b5snecjr04TRoZq3zUc/OLc9BBCGJdINRJLsTbOmHXIdHqTME6cYfTjjycOKoxtVVQATH
	XoR88RXyJcG94szI7Tzo/GIagz0U2NB/d5k6zKm3EM6JGR314gDWmvUoa2aOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1766035505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=urIdvOKE9IoKEH1mnEpP65trf21mUReHnkTsYihVf1s=;
	b=kM8FOwDITPcdx0MdOctkWvWmd2rToaWELAK7+1PbMvxUmeKkdVkye7/JmeJFTVftmKys8a
	1AYhLMpRHaIHagCPlZYSiG3lm+C4H1YWIQJIDAc47k/QMe81hh+FSC4lylF7Z575rbRAms
	Up4lWJSZ2zFOjvGAtty70xEnf/Y1tmF2k1NJghRdt1b3bNG4Vf1S3RL+Om0xVMHYS5hTvn
	tOkj6nyMIDd4Ab4eh3qzdfmwfF2p3qZfBuJbAisbyjCwb8dunghRlFOJEXRPVnK7O7K5eI
	SjmGPtLIQ9Sgk6LVVVELHx3tnvRkdKxyAhe9ZtnVLDPwUWftlvKN7cZsiUNGXg==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-dzfg8;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Eight-Print: 4f585c8726d26867_1766035505964_1333287826
X-MC-Loop-Signature: 1766035505964:1420442719
X-MC-Ingress-Time: 1766035505963
Received: from de-fra-smtpout6.hostinger.io (de-fra-smtpout6.hostinger.io
 [148.222.55.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.213.181 (trex/7.1.3);
	Thu, 18 Dec 2025 05:25:05 +0000
Received: from [IPV6:2001:861:4450:d360:6f03:783f:9b5b:57c1] (unknown [IPv6:2001:861:4450:d360:6f03:783f:9b5b:57c1])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWzd946m0z3wpT;
	Thu, 18 Dec 2025 05:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1766035502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urIdvOKE9IoKEH1mnEpP65trf21mUReHnkTsYihVf1s=;
	b=f0A7TBvTM/71zN2GD9eYZQvlPSoi/byxGJUXJjs0x2E9D2tjfC8KN66GDMd7RiwFOWB9X+
	Dfr0Y0wEk645IbxHaogrPIhtJJTrd+XiEI38enfb21tae+Aa0cEh2iGMxIPTlFSOVIxMs7
	jnCt9ZTosaFHw2SYr0fKazZPHA+oXCDAoghoufePAcuGOMLTV/gdatEkGW/evBqTIgS8g0
	BtVIFmZtPv351F2bUOEB4BplAENeaTXuYsoamC7QJFfhroNcKpdQky0z/4YWUvpv1PJ1jQ
	hINVRNS8dBEq6PdH29sluYkXOQoRHk21rDkNu2dyqnG7WfRjhVRGEDZiOoP4aA==
Message-ID: <e1cb227b-a55e-4962-b7e1-b540ba92012c@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Iker Pedrosa <ikerpedrosam@gmail.com>,
 Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
To: Johannes Erdfelt <johannes@erdfelt.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie> <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie> <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
 <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com>
 <20251217221004.GD31109@sventech.com>
 <d5917806-56db-4945-b336-89bd1027f613@rootcommit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <d5917806-56db-4945-b336-89bd1027f613@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 18 Dec 2025 05:25:01 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=6943902e a=TJDTwvido1ACHfu3sFfMdQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=uFDut6XBOhzVI-v-qFQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfDWWmxv5IFLiCstey/NVEdTTLCJeVIprXPUSmNdHxNzHiYgsksFDNJD+jKa/ljM7ingQXCC9VVL1AgWs2CcNaYzyb9t/3t73iAnkwwQJUhLgluYobPWf JdThafXKRspOAje+xh9xGCpZSf1Y8wmhxN3XbQe0rguO6F3OVLwR3BtEJac2nDQpfoZuEQngPhJHmGT1mWgNoB2oCMwtUmV0PZUXqpD9V5tcNmFZBTDlnRYX V6/MD08JBN0XykOtYOxZhfN5uFD1iCR7MoTiI5JPhkzPe2exoazuv/4XWP40BCaGamDn4wDaUdl3UTPkAGcL45lwQ5z5Zi63MtHuI/b29xuTyyhneAgAfbOJ P24HqllxIAbX4UxAAz+LCDOiALq/CbvFnWVTWjDIbelonCyaFtu1nOcE4lVuaJWiGOXt4g+UiOfmsiWHdhxLK+7XCnoAhWPweG6O8dIcsB/3bUtGn//iibpo bINVx4f+QkYxxaeChDHrcem4wT14OKoj98A3SrGbDBa9fS3qUpJKFLANmxaSR8ZBraOUXh3R70MIFp/uypP9s4daqXhHdj691UFC+rBgipInF/3dUpOm5NYU NXxu9nsVUHupeK+IBLWUVwLj
X-AuthUser: michael.opdenacker@rootcommit.com


On 12/18/25 06:19, Michael Opdenacker wrote:
>
>  * You won't be embarrassed if you already passed these first two 
> checks ;)
>  *

I'm the one getting embarrassed 😅. Copying and pasting from Joplin 
notes into Thunderbird really made my reply ugly...

This made me forget a quite important rule: send the patches to yourself 
first:
b4 send --reflect

Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/

