select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + p.v6 as v1,
    round(p.v6 / 2.0, 4) as v2,
    p.v6 + p.v5 as v3,
    round(p.v5 / 5.0, 4) as v4,
    round(p.v5 / 11.0, 4) as v5,
    round(p.v5 / 7.0, 4) as v6,
    p.v6 * 7 as v7
from {{ ref('int_ev_0056') }} as p
