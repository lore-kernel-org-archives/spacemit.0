Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA0335959
	for <spacemit@lists.linux.dev>; Tue,  8 Jul 2025 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751941215; cv=none; b=MspfZfJkAyfBCu/k+zvTkXL4IMdkdrFcNM3+31982fEz08Ft7jBdJc3oFCXYS3PWRtWm43oDQHv7nC4o/zwz101eG1ZE3uVIoV6+Rq1tzcvZtGD11dH7FA3pmCWV94QMq/FlwzJ1OffxcNxadRwPpsWHYn2f+9129wDirZ7JkuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751941215; c=relaxed/simple;
	bh=sn6rljpu0rRcMnoOSCho0NKqgniXWyhTWQpWa6PH9uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOks3XHsDgjYLl+CBaSOgCin88fojsVLKdol/As02c/453U2dVw4Dcqx6+XUP+QSn/+2dfu8RxvHIjUKvPuH3ANHm4u2+r0i7nxX95PPv+tBJfV1ybPcMtqHXCNFWR4jceS6vgnqU/GdLGKw9CIuNbrtFYGcuNwDZdtD8TpRXkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.33.69] (unknown [210.73.43.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3y1s7gGxoHwLzAQ--.7093S2;
	Tue, 08 Jul 2025 10:19:40 +0800 (CST)
Message-ID: <8c917152-0260-4442-a944-3cc0b3356e04@iscas.ac.cn>
Date: Tue, 8 Jul 2025 10:19:38 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: Add support for
 SpacemiT K1
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 Conor Dooley <conor.dooley@microchip.com>, netdev@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jakub Kicinski <kuba@kernel.org>,
 linux-riscv@lists.infradead.org, Simon Horman <horms@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Vivian Wang <uwu@dram.page>, Yixun Lan <dlan@gentoo.org>,
 spacemit@lists.linux.dev, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
References: <20250703-net-k1-emac-v4-0-686d09c4cfa8@iscas.ac.cn>
 <20250703-net-k1-emac-v4-1-686d09c4cfa8@iscas.ac.cn>
 <175153978342.612698.13197728053938266111.robh@kernel.org>
 <17733827-8038-4c85-9bb1-0148a50ca10f@iscas.ac.cn>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <17733827-8038-4c85-9bb1-0148a50ca10f@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:zQCowAA3y1s7gGxoHwLzAQ--.7093S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1DCrWfKrWfJF4kAryxXwb_yoW8AF47pa
	yak3ZIkF1qyr47Aw4avwn29a4F9r1rKFyUXF9Iqw1vqan8X3WftryS9r15u3W8ZrWxAFyY
	vr15W3W5CFyDAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUkWSrDUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On 7/3/25 20:31, Vivian Wang wrote:
>
> On 7/3/25 18:49, Rob Herring (Arm) wrote:
>> On Thu, 03 Jul 2025 17:42:02 +0800, Vivian Wang wrote:
>>> The Ethernet MACs on SpacemiT K1 appears to be a custom design.
>>> SpacemiT
>>> refers to them as "EMAC", so let's just call them "spacemit,k1-emac".=

>>>
>>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> =C2=A0 .../devicetree/bindings/net/spacemit,k1-emac.yaml=C2=A0 | 81
>>> ++++++++++++++++++++++
>>> =C2=A0 1 file changed, 81 insertions(+)
>>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Error:
>> Documentation/devicetree/bindings/net/spacemit,k1-emac.example.dts:36.=
36-37
>> syntax error
>> FATAL ERROR: Unable to parse input tree
>
> My bad. The example still depends on the reset bindings for the
> constant RESET_EMAC0. I just tried with reset v12 [1] and that fixes it=
=2E
>
> [1]:
> https://lore.kernel.org/spacemit/20250702113709.291748-2-elder@riscstar=
=2Ecom/
>
> Vivian "dramforever" Wang=C2=A0
>
Just for the record for anyone watching this thread, I'm most likely
going to be holding off sending the next version of this until reset v12
(probably?) gets at least taken up by a maintainer.

It's a bit of a weird situation over there since they're sending the
reset controller stuff through the clk tree, but then it's also a
mega-syscon situation for the K1 and that's how they decided they want
it, so it is what it is.

(The DMA bus dependency that was in v3 is all DTS changes with no
bindings and no driver, so that could be easily handled entirely in the
SpacemiT SoC tree, which is nice.)

Vivian

>> [...]

