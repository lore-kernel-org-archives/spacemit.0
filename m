Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED0375ADF
	for <spacemit@lists.linux.dev>; Tue,  3 Mar 2026 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531703; cv=none; b=HgaNt+I2C2Npl7uxtuzG7+7IgyA1FBMzJsPAHPoZKNmkSsqko9AbZcojiwFkE8PbQwi770o0fQOsbBj/iX/MiMeL0KN+VzCiTj0KsuoMbj6LesLiPjjuYJ0ZCXgTmBBRR9T4yrdj82717JsO6OVWeZA67MAL4dHUETe3mhYGC8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531703; c=relaxed/simple;
	bh=uQuEV1L4Zeytm0zMAGjwc1P5mrMbM/X3GwH/RfOzjDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dwpv1WSAEIGXaP1LC+7yILN7o1LTPJ+Aw6f6QeoLx2LeebWR11KQot5gjnQ8EL2YN1QxuHPPZ0rB554GSyhUIpfAgEfHg3ZuB1adPB/2fLYJKWH80cD1/XNeUswIxxy8WQpjK167g+jgp7gvxJK5rNAOA23Caf67diq79AaxPj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [10.213.20.192] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAB3zhHor6ZpCWyTCQ--.36234S2;
	Tue, 03 Mar 2026 17:54:49 +0800 (CST)
Message-ID: <ded1cb94-8484-4ea3-ba7a-22fa76547db9@iscas.ac.cn>
Date: Tue, 3 Mar 2026 17:54:48 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe
 nodes for K1
To: Yixun Lan <dlan@gentoo.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlan@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, spacemit@lists.linux.dev
References: <20260202100000.19176-1-amadeus@jmu.edu.cn>
 <20260302071502.63672-1-amadeus@jmu.edu.cn>
 <20260302074235-GYB288339@gentoo.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260302074235-GYB288339@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:zQCowAB3zhHor6ZpCWyTCQ--.36234S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw1DGFy8JF17JFWDWFy8Zrb_yoWDCFb_uF
	yDAr1DC34DKryxKr1Fkws3XrWxA3y8Kw18trn3GFy2k3s5X39agFsYkFn3ZayxJFZ7GrnI
	yF1Fv3y3Zr1YvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbakYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUxsXoUUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/


On 3/2/26 15:42, Yixun Lan wrote:
> Hi Chukun,
>
> On 15:15 Mon 02 Mar     , Chukun Pan wrote:
>> Hi,
>>
>>> The SpacemiT K1 SoC has 3 PCIe EP controller nodes. Add the
>>> 'linux,pci-domain' property to assign a PCI domain number to
>>> each of the controllers instead of assigning it randomly.
>> Does anyone have any thoughts on this?
>> Without this patch, the PCI domain number is random.
>>
> You describe what's has been done here, but no why?
> Can you add description about why problem with random domain,
> and the motivation of the change behind?
>
> from my understanding of reading DT document, either way seems
> fine..

For example systemd-udevd provides the interface name based on the
segment group / domain number, so if you add an additional PCIe network
card, the name of the network interface will flip between enP0p1s0 and
enP1p1s0, which is a bit inconvenient.

This isn't inherently a problem (these things were never as predictible
as they wanted anyway) but a convenience would still be nice.

Vivian "dramforever" Wang

