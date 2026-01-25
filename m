Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C61C3EBF18
	for <spacemit@lists.linux.dev>; Sun, 25 Jan 2026 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769346178; cv=none; b=XdCZAfkh7IeYV6g1XU4j5lg+4kgo/k5LHdffijk8KKJ3Lfaz2TcCkslsHRo4WEOCruCsFGPssnL3gnQO5XNNkS1NQuZBdBrh0TdfP4+BdjdjOJU/3dEJMqQxwa2VRHTeXp0DfGMjafexkl1W03D1qwA1B+4ZN3+PVm7CCSIj8oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769346178; c=relaxed/simple;
	bh=xtre1dUDUYZ4Q/Evoopq2aLMZmm8uOX3MPShwyhMd3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9VU/e1zMVih9jdqqMN2Xl73zB7cmgL4sraIjLIYV74EmVTj0ea2r9ONaz4o4KG6JsNWFjwUu24/HLu4+55oR9ztkBJKO1rxg5KYwzN7F8I1xwaVFUf7/FVbLp6tIIMFlPAdVJ6iNDqnA/Pd3kO3Qub+zXNT3Tw9g35lU/Qxxd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.107] (unknown [123.118.222.47])
	by APP-01 (Coremail) with SMTP id qwCowACH825yFHZpgUgsBg--.19908S2;
	Sun, 25 Jan 2026 21:02:43 +0800 (CST)
Message-ID: <b705ceed-3ee1-49ec-8f8e-e885e87f871e@iscas.ac.cn>
Date: Sun, 25 Jan 2026 21:02:42 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn>
 <CAH1PCMZq++FYr_2WB=HvouXvnxcYGFk6tngqNUk3zTOM6xXLZQ@mail.gmail.com>
 <CAH1PCMbEcVa6mAvw9UAG2T2Jy0W-+nEcw79nTHDJr9xgEdm0VA@mail.gmail.com>
 <20260125110333-GYD71302@gentoo.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260125110333-GYD71302@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACH825yFHZpgUgsBg--.19908S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1kGrWxArWfJrWrKF4DArb_yoW5Gr18pa
	9Ika9rKFWkKr4fZwnFkw1IyayFy397Jw45W345Kw15Gr90vF1agF1UK3yY9Fy3Gr4kCw42
	yrWUKas3JF90v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07bIBTOUUUUU=
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/


On 1/25/26 19:03, Yixun Lan wrote:
> Hi Guodong,
>
> On 12:27 Sun 25 Jan     , Guodong Xu wrote:
>> On Sun, Jan 25, 2026 at 12:18 PM Guodong Xu <guodong@riscstar.com> wrote:
>>> On Sat, Jan 24, 2026 at 2:25 PM Vivian Wang <wangruikang@iscas.ac.cn> wrote:
>>>>
>>>> On 1/24/26 08:20, Guodong Xu wrote:
>>>>> [...]
>>>>>
>>>>> Note: Patch 3 introduces a bisect breakage by transitioning to
>>>>> pin-specific supply names. Probe failures will occur on existing boards
>>>>> until Patch 4 updates the corresponding DTS file.
>>>> Ouch, that's not a bisect breakage, that's an *ABI breakage*. And AFAICT
>>>> this is still not okay in 2026,
>>>> see Documentation/devicetree/bindings/ABI.rst
>>>>
>>>> So the bindings would need to be changed to accept both the new and old way.
>>> Ideally yes. However, considering this ABI change's actual effect, the two
>>> K1 boards (BPI-F3 and Jupiter) in the kernel get their power settings
>>> from boot firmware as well, and the types of peripherals enabled in the .dts
>>> files are very limited, the probe failure of the pmic regulator doesn't
>>> affect much. So, I think this breakage is acceptable.
>>>
>>>> Driver-wise, at a cursory look from someone not familiar with the
>>>> regulator stuff, maybe we can make it compatible with old DTS by adding
>>>> the new names as aliases ({devm_,}regulator_register_supply_alias?) as
>>>> "vin" or "buck5", if we see the old vin-supply definitions?
>>>>
>>> We can do that of course. My hesitation is, however, it makes the driver take
>>> extra code which may not be needed once all .dts files have been updated. The
>>> driver code will be left there forever.
>>>
>> Mark gave his opinion in v1 review [1], please allow me to partially quote
>> here: "(it's an ABI change so shouldn't really happen, but perhaps there are
>> few enough users for everyone to coordinate and it's what you all prefer)."
>>
>> I do expect to collect more ideas before I decide whether and what to do in
>> v3, or maybe v3 is not required.
>>
> As I checked the dts tree (DT queued for v6.20), although we introduced the
> regulator of P1/PMIC, but there is no consumers so far, so in real life, we
> shouldn't break anything. In this case, I'd suggest we just give up for doing
> the ABI backward compatible work which should simplify our life..

Having checked again, I agree that this is not that big of a problem.
The breakage with old DT is limited to an otherwise harmless error on
boot that doesn't affect functionality since there are no users.

Vivian "dramforever" Wang.

