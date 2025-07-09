Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7F446B8
	for <spacemit@lists.linux.dev>; Wed,  9 Jul 2025 07:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752045472; cv=none; b=LWcDegKT70xyI440iI/r/C1QjoJfCcB92jtWFIexJiS5h45A45j93gACeijVTjMVtQksdT8JUeWNzaSsSKeikhD8ILHdp9kl43lHqAnPdJSlzfzHC+RucwLAfDOBVpi0aNuJ9CPM3Sd6fpPy9stTeyNo16sthEBhNo9XCVjqAtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752045472; c=relaxed/simple;
	bh=PpIi2C+tr5rIr8+QjLO2OXAvYjE4FidpKkXkcsj5uD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLqAVrNFFJczOjjJYRg+At/ACSL1ecDZB1YxjxYw4cht1e4XbSb+L5AGg7/h/alQq328YIOsQsAHJClzFK4wJoFvvt2O+pq7RRGEDZhZ7w262mJVPHiHFVZBpJPzQF6SFH7iSf/iKDJE48ciH4kqNaDP4M0UOAoMjvnYNsNir5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.104] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowAAHNKiFF25oW8BfAg--.1894S2;
	Wed, 09 Jul 2025 15:17:26 +0800 (CST)
Message-ID: <742cb5df-cf63-44be-b671-f834ba025d4e@iscas.ac.cn>
Date: Wed, 9 Jul 2025 15:17:25 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Yixun Lan <dlan@gentoo.org>, Vivian Wang <uwu@dram.page>
Cc: Guodong Xu <guodong@riscstar.com>, Ze Huang <huangze@whut.edu.cn>,
 Alex Elder <elder@riscstar.com>, spacemit@lists.linux.dev,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
 <20250709064009-GYB487904@gentoo>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250709064009-GYB487904@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qwCowAAHNKiFF25oW8BfAg--.1894S2
X-Coremail-Antispam: 1UD129KBjvdXoWrCF4ktw4UXFy8Jw1UtFW5KFg_yoWxGwbE9F
	1rtw48t3s8JFWq9w43Kw1fZrnxGaykAFyFqw45t3s3uwnxA3W5Xrs3GFykt3W3Jan5KFy7
	WFZ5ZrsYvw45WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU8fpnPUUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On 7/9/25 14:40, Yixun Lan wrote:
> [...]
>
> Hi Vivian,
>
>    We'd like to push this series for v6.17, so I've queued it at
> k1/dt-for-next branch of SpacemiT SoC tree [4] for now, FYI.

Thanks, the DTS changes look good to me.

One oddity I noticed is that there's a pinctrl in the middle of the list 
of pwm*, but that is indeed correctly sorted by address, and the 
addresses seems to be correct. So, not a problem.

Vivian "dramforever" Wang

> Link: https://lore.kernel.org/all/2dc8ab35-4f58-49d3-8e8b-3e463fa592ae@kernel.org/ [3]
> Link: https://github.com/spacemit-com/linux/tree/k1/dt-for-next [4]
>
> Thanks all

