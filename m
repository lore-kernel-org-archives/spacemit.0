Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4AA550DA7
	for <spacemit@lists.linux.dev>; Wed,  9 Sep 2026 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957048; cv=none; b=BGSsHaX1XIZaVx2oavTrNQ+tBD0VzIw6pfhlmdlxMKZHEJbAIZ2jZwc9PS2q8Qeysv95gPqP8SCtlrhXnUu5TcKdvHCmJ3le8iI4HCtF6fCTXx5YnbQbYsRs1WxtkdqIEZtCercmzZ4Ed3vF5zfkuIjih7Eqo98gGE2F7/us0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957048; c=relaxed/simple;
	bh=7afWyJrgsN57alnTpiCGsFn56XEnuhrNtY5V8paD4gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9i5FTbheNNTcLgCVhUifzanHBBMMz1Wj2K8OwO8BTTADP9Dg4KgCuie5L2vAl5HgWWsuBZI4cCB+f+Z62+hQh19J3QphE2nFwZaGqX6etGBuYUMD3YBTXUDn3B1MXyMMHlXxewwZmKqdnNBq3ANTllAwcVDrha9xNO/3+IbzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=RZWJ2x2b; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="RZWJ2x2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788956999;
	bh=aeduXdi3SI6oI4pP0SAUmrHkqfi0yxLPGaWIRs91kj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=RZWJ2x2bYLWDDzhDPe1MLA2eM9FcY84bTxjWyhtgRfJ+y7p32To0uob5WKEKzdr0N
	 6EovMSvr/ZMokJlw1I4sOIdnqMP7j9jvsxLLzPC6zmwvOyLkgdxbeB8o5IXfk6kvn1
	 JjsU8gzEevUSBDeMlmK0cbs8gD1fjvlQc0bnRBlc=
X-QQ-mid: zesmtpgz3t1788956992tc3d62d03
X-QQ-Originating-IP: J4TZjWEglTlVV6Shn61/s20jdDhPdX9NmfYn/tUuNMk=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 20:29:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12943038780183731438
EX-QQ-RecipientCnt: 21
Message-ID: <6979EDB8BC55840B+13690640-896a-4b3a-afa7-09079192b695@linux.spacemit.com>
Date: Wed, 9 Sep 2026 20:29:49 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] dt-bindings: usb: ci-hdrc-usb2: require clocks and
 resets for spacemit,k1-usb2
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Ze Huang <huang.ze@linux.dev>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-2-f07342ffa051@linux.spacemit.com>
 <20260908-tapering-panic-e76cb4114d92@spud>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <20260908-tapering-panic-e76cb4114d92@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: N24fqzDYEFI9r/JvjUF4+JSd1XvAKu1Gp/czPXEY1nJpx9WlFEv2ofUW
	NgdGunUZ3OaXJh0b2Y5RX+FzPygRgXBSOh+dM7OfwsjglNdJwoVejZdmm5fJJ0Y2X5tTEt4
	ca7zQ3QWdB+fS7bRvUUzMgOdf9HH6HuRWKRbUVuuSVjz9oXsuOepXg7lMpi5JR2GZhFwG/8
	S9m/EIu2EtLQNYSmzXEa1Kwv/KpVx1bYbXv4rnq1rFQsuY4KsEiTbNDSK0asrsbjzlsxSQS
	a9t34WI2U+1w/+u7jLQjjddI5X7iWcSUNkUxjT+xeyxeTwF5CgSYZEfWWkOsY61eTEwrgjw
	VlmLjU00iBIPT8BFnBUXo/CSO8PwUqJU4R/T3GfZq5hyPL881GQOas5uGQkFo2T1GMUDUAO
	3FV1/89kwWwHjqUFSGrkp+oScmfI7efgsIuNs074ZmwLyFgjzNoLx1FHpplQPC6OKgmgZC5
	ErocrnhIzhnUfdjzlwn0GxcjpLIVao21SDw8i8iIHF9TyiHZECQ442WyBV9LEIQX4bOXR77
	odxHNzK6fovTsC57hJWus+Cu3J01b2q13uxm0mdkUiLufLwK7OJo67Ew3Q9aKXqyETLw7u5
	v5OBlh1eZZBbOl7X1I1GvK3Id9fYKKY12K1cyZtePtSmjuJVlt/yktgDiiAguneNqCATBNg
	vDHDsp+BR/jn5GOtseL8rSWNDzEczJb90OzdAjQA07O+vvgnwS3qQBV4QQIn7e22l3JFGZ4
	3vsv0adXmcs52o6PjGONNnf4aql8yguuWKjnJXiWBQvEvTbUK4+ct3o3BBiZg11p+WjjNUS
	UDif5N9jFXn9Lm/ZshhkrEhrbobOT0rahpMc0cKDCsTiAK21I3OnU0Rm+Gqw9Jv3ulQpQno
	T7po6STj4Wee8Bzanl+NkGg/x9VDXUiRdMnt/zxwZ0wx7NtjvgTiNsjIUDaQt7DqJApSltN
	kJWv8OOS5i/I6ijHSAHA4FFmVV+2dTciXBtoYNK7ay8zuTflKwlAMOHUPk/qTTQhnQ2mKcI
	fZw5hmWdskABobGJ2M9Xc5ogrco7IF09tKoZ/nRBfRdgHaMrMrhjqb4DROeQKEN+lME2fR4
	uCmjxwwg5YY+9x9MNgyXSWnDf0hmI/VP5qjtqdOeBpfmV3DV75E9g9mbZrndzPtcQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On 9/9/2026 1:50 AM, Conor Dooley wrote:
> On Tue, Sep 08, 2026 at 05:48:39PM +0800, Junzhong Pan wrote:
>> Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
>> work, add constraints for it.
>>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> 
> Squash this into patch 1.

Ok, thanks

> 
>> ---
>>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> index 6f8d88a0681d..5c2b7eb1a6ff 100644
>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> @@ -114,6 +114,20 @@ allOf:
>>            maxItems: 2
>>          clock-names:
>>            maxItems: 2
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: spacemit,k1-usb2
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
>> +        resets:
>> +          minItems: 1
>> +      required:
>> +        - clocks
>> +        - resets
>>  
>>  unevaluatedProperties: false
>>  
>>
>> -- 
>> 2.34.1
>>

